<<<<<<< HEAD
module EventsHelper  
  def days_in_month(month, year = Time.now.year)
   common_year_days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return 29 if month == 2 && Date.gregorian_leap?(year)
    return common_year_days_in_month[month]
  end
=======
module EventsHelper
   def days_in_month(month, year = Time.now.year)
      common_year_days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	  return 29 if month == 2 && Date.gregorian_leap?(year)
      common_year_days_in_month[month]
   end
>>>>>>> e1fa15377a028abe9d1cd8f9d4491dfa58d3a015
end
