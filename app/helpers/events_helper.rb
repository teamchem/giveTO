module EventsHelper
   def days_in_month(month, year = Time.now.year)
      common_year_days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	  return 29 if month == 2 && Date.gregorian_leap?(year)
      common_year_days_in_month[month]
   end
end
