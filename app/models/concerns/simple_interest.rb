module SimpleInterest
  extend ActiveSupport::Concern

  included do |klass|
    def project(from = nil)
      from ||= Date.today
      year = from.year
      v = value.to_f
      frac = from.yday / Date.new(year, 12, 31).yday.to_f
      v *= (1 + (interest_rate || 0) * frac / 100.0)
      res = [ [ year, v.to_f ] ]
      last = person.birthdate + 100.years
      year += 1
      rate = 1 + (interest_rate || 0) / 100.0
      year.upto(last.year) do |y|
        v *= rate
        res << [ y, v.to_f ]
      end
      res
    end
  end
end
