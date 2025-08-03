class Taxes
  def initialize status
    @status = status
  end

  def income_tax year, income, dependents=0, deductions=nil
    scale = (1 + 0.03) ** (year - TAX_TABLES_YEAR)
    std = STD_DEDUCTION[@status] * scale
    deductions ||= std
    agi = income - [deductions, std].max
    taxes = 0
    last = 0
    TAX_TABLES[@status].each do |rate, level|
      level *= scale
      amt = [0, [level - last, agi - last].min].max * rate
      taxes += amt
      last = level
    end
    taxes.round
  end

  def social_security_tax year, income
    scale = (1 + MAX_SSI_INCOME_INCREASE_RATE / 100.0) * (year - TAX_TABLES_YEAR)
    ([income, MAX_SSI_INCOME * scale].min * SSI_RATE).round
  end

  def medicare_tax year, income
    scale = (1 + 0.03) * (year - TAX_TABLES_YEAR)
    base, limit, extra = MEDICARE_TAXES[@status]
    ((income * base + [0, income - limit].max * extra) / 100.0).round
  end

  MAXINCOME = 99999999
  # 2025
  TAX_TABLES_YEAR = 2025
  STD_DEDUCTION = {
    single: 15750,
    married: 31500,
    head_of_household: 23625,
  }

  SSI_RATE = 6.2
  MAX_SSI_INCOME = 176100
  MAX_SSI_INCOME_20YR = 90000
  MAX_SSI_INCOME_INCREASE_RATE =
    ((Math.exp(Math.log(MAX_SSI_INCOME / MAX_SSI_INCOME_20YR.to_f) / 20) - 1) * 100000).round / 1000.0

  MEDICARE_RATE = 1.3
  TAX_TABLES = {
    single: [
      [0.10, 11925 ],
      [0.12, 48475 ],
      [0.22, 103350],
      [0.24, 197300],
      [0.32, 250525],
      [0.35, 626350],
      [0.37, MAXINCOME],
    ],
    married: [
      [0.10, 23850 ],
      [0.12, 96950 ],
      [0.22, 206700],
      [0.24, 394600],
      [0.32, 501050],
      [0.35, 751600],
      [0.37, MAXINCOME],
    ],
    head_of_household: [
      [0.10, 17000],
      [0.12, 64850],
      [0.22, 103350],
      [0.24, 197300],
      [0.32, 250500],
      [0.35, 626350],
      [0.37, MAXINCOME],
    ],
  }
  MEDICARE_TAXES = {
    single: [1.45, 200000, 0.9],
    married: [1.45, 250000, 0.9],
    head_of_household: [1.45, 200000, 0.9],
    married_filing_separate: [1.45, 125000, 0.9],
  }
end
