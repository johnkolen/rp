class Simulator
  class Parameters
    def initialize
    end
  end

  def initialize **options
    @assets = options[:assets] || []
    @liabilities = options[:liabilities] || []
    @incomes = options[:incomes] || []
    @expenses = options[:expenses] || []
  end

  def person
    @person = @assets.first.person
  end

  def first_year &block
    from ||= Date.today
    year = from.year
    @frac = from.yday / Date.new(year, 12, 31).yday.to_f
    @last_year = (person.birthdate + 100.years).year
    yield year if block_given?
    year
  end

  def init_incomes year
    @incomes.each do |x|
      x.init_amount year
    end
  end

  def get_income year
    @incomes.inject(0) do |sum, x|
      sum += x.amount * @frac
      @taxable += x.taxable_amount
      @ssi_taxable += x.ssi_taxable_amount
      x.update_amount year
      sum
    end
  end

  def init_expenses year
    @expenses.each do |x|
      x.init_amount year
    end
  end

  def get_expense year
    @expenses.inject(0) do |sum, x|
      sum += x.amount * @frac
      x.update_amount year
      sum
    end
  end

  def init_assets year
    @assets.each do |x|
      x.init_value year
    end
  end

  def get_assets year, adjust
    allocate = @assets.map{|a| [a, adjust / @assets.size.to_f] }.to_h
    @assets.inject(0) do |sum, x|
      alloc = allocate[x]
      x.update_value year, alloc, @frac
      @taxable += x.taxable_gain
      @ssi_taxable += x.ssi_taxable_gain
      sum + x.value
    end
  end

  def init_liabilities year
    @liabilities.each do |x|
      x.init_value year
    end
  end

  def get_liabilities_payment year
    @liabilities.inject(0) do |sum, x|
      sum + x.payment(year) * @frac
    end
  end

  def get_liabilities year
    @liabilities.inject(0) do |sum, x|
      x.update_value year, @frac
      sum + x.value
    end
  end

  def run
    taxes = Taxes.new :single
    start_year = first_year do |year|
      init_incomes year
      init_expenses year
      init_assets year
      init_liabilities year
    end
    start_year.upto(@last_year) do |year|
      @taxable = 0
      @ssi_taxable = 0
      income = get_income year
      expense = get_expense year
      expense += get_liabilities_payment year
      balance = income - expense
      assets = get_assets year, balance
      liabilities = get_liabilities year
      row = {year: year,
             income: income.to_i,
             expense: expense.to_i,
             balance: balance.to_i,
             assets: assets.to_i,
             liabilities: liabilities.to_i,
             networth: assets.to_i - liabilities.to_i,
            }
      puts @taxable
      puts taxes.income_tax year, 0, 0
      puts row.inspect
      @frac = 1
    end
  end
end
