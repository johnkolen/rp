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
    @last_year = (person.birthdate + 70.years).year
    yield year if block_given?
    year
  end

  def init_incomes year
    @incomes.each do |x|
      x.init_amount year
    end
  end

  def get_income year
    res = {}
    cnt = 0
    res[:total] = @incomes.inject(0) do |sum, x|
      y = x.amount * @frac
      res[x.name || "Income#{cnt+=1}"] = y.to_i
      sum += y
      @taxable += x.taxable_amount
      @ssi_taxable += x.ssi_taxable_amount
      x.update_amount year
      sum
    end
    res
  end

  def init_expenses year
    @expenses.each do |x|
      x.init_amount year
    end
  end

  def dep_get_expense year
    res = {}
    cnt = 0
    res[:total] = @expenses.inject(0) do |sum, x|
      y = x.amount * @frac
      res[x.name || "Income#{cnt+=1}"] = y.to_i
      sum += y
      x.update_amount year
      sum
    end
    res
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
    res = {}
    cnt = 0
    res[:total] = @liabilities.inject(0) do |sum, x|
      y = x.payment(year) * @frac
      res[x.name || "Liability#{cnt+=1}"] = y.to_i
      sum + y
    end
    res
  end

  def get_liabilities year
    res = {}
    cnt = 0
    res[:total] = @liabilities.inject(0) do |sum, x|
      y = x.value
      x.update_value year, @frac
      res[x.name || "Liability#{cnt+=1}"] = y.to_i
      sum + y
    end
  end

  def get_generic klass, values, &block
    res = {}
    cnt = 0
    res[:total] = values.inject(0) do |sum, x|
      y = yield x
      y = y.round
      res[x.name || "#{klass}#{cnt+=1}"] = y
      sum + y.round
    end.to_i
    res
  end

  def get_income year
    get_generic Income, @incomes do |x|
      y = x.amount * @frac
      @taxable += x.taxable_amount
      @ssi_taxable += x.ssi_taxable_amount
      x.update_amount year
      y
    end
  end

  def get_expense year
    get_generic Expense, @expenses do |x|
      y = x.amount * @frac
      x.update_amount year
      y
    end
  end

  def get_liabilities_payment year
    get_generic Liability, @liabilities do |x|
      x.payment(year) * @frac
    end
  end

  def get_liabilities year
    get_generic Liability, @liabilities do |x|
      y = x.value
      x.update_value year, @frac
      y
    end
  end

  def get_assets year, adjust
    allocate = @assets.map{|a| [a, adjust / @assets.size.to_f] }.to_h
    get_generic Asset, @assets do |x|
      alloc = allocate[x]
      x.update_value year, alloc, @frac
      @taxable += x.taxable_gain
      @ssi_taxable += x.ssi_taxable_gain
      x.value
    end
  end

  def run
    taxes = Taxes.new
    start_year = first_year do |year|
      init_incomes year
      init_expenses year
      init_assets year
      init_liabilities year
    end
    res = {}
    start_year.upto(@last_year) do |year|
      @taxable = 0
      @ssi_taxable = 0
      income = get_income year
      expense = get_expense year
      lpayment = get_liabilities_payment year
      expense[:total] += lpayment.delete(:total)
      expense.merge! lpayment
      net_income = income[:total] - expense[:total]
      assets = get_assets year, net_income
      liabilities = get_liabilities year
      net_worth = assets[:total] - liabilities[:total]
      row = {year: year,
             income: income[:total],
             expense: expense[:total],
             net_income: net_income,
             assets: assets[:total],
             liabilities: liabilities[:total],
             net_worth: net_worth
            }
      puts @taxable
      puts taxes.income_tax year, :single, @taxable, 0, 0
      puts row.inspect
      puts income.inspect
      res[year] = {
        income: income,
        expense: expense,
        net_income: net_income,
        assets: assets,
        liabilities: liabilities,
        net_worth: net_worth
      }
      @frac = 1
    end
    res
  end
end
