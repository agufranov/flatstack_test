module ActiveSupport
  class TimeWithZone
    def in_int_span_from(d, interval, in_future)
      return false if(in_future && (self - d > 0))
      case interval
      when 'once' then in_same_day_with(d)
      when 'day' then in_int_days_from(d)
      when 'week' then in_int_weeks_from(d)
      when 'month' then in_int_months_from(d)
      when 'year' then in_int_years_from(d)
      else raise NotImplementedError
      end
    end

    def in_same_day_with(d)
      beginning_of_day == d.beginning_of_day
    end

    def in_int_years_from(d)
      yday == d.yday
    end

    def in_int_months_from(d)
      day == d.day
    end

    def in_int_weeks_from(d)
      span_divisible_by d, 7
    end

    def in_int_days_from(d)
      span_divisible_by d, 1
    end

    def span_divisible_by(d, n)
      ((beginning_of_day - d.beginning_of_day) / 1.day) % n == 0
    end
  end
end
