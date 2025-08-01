class Taxes
  def initiailize
  end

  def single year, income, dependents=0, deductions=nil
    scale = (1 + 0.03) * (year - 2025)
    std = 15750 * scale
    deductions ||= std
    agi = income - [deductions, std].max
    taxes = 0
    last = 0
    [[11925, 0.1], [48475, 0.12], [103350, 0.22],
     [197300, 0.24], [250525, 0.32],
     [626350, 0.35], [9999999, 0.37]].each do |level, rate|
      level *= scale
      taxes += [0, [level - last, agi - last].min].max * rate if agi <= level
      last = level
    end
    taxes.round
  end

  # std = 31500 married
  # std = 23625 head

  def income_tax year, status, income, dependents=0, deductions=nil
    send status, year, income, dependents, deductions || 0
  end

end
