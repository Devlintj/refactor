
def leap_year(year)
	multiple?(year, 100) ? multiple?(year, 400) : multiple?(year, 4)
end

def multiple?(year, divisor)
	year % divisor == 0
end

SECONDS_IN_A_YEAR = 1.0*60*60*24*365 #31536000.0
def percentage_of_year(seconds)
	format_as_percentage(seconds / SECONDS_IN_A_YEAR)
end

def format_as_percentage(n)
	('%.1f' % (n * 100)) + '%'
end

def standard_to_military(time)
	hour, rest = time.split(":")
	minutes, meridiem = rest.split(" ")
	military = ""
meridiem = meridiem.downcase
	if meridiem == 'pm' && hour.to_i == 12
			military = hour + ":" + minutes
	elsif meridiem == 'pm'
			military = (hour.to_i + 12).to_s + ":" + minutes
	end

	if meridiem == 'am' && hour.to_i == 12
		military = (hour.to_i - 12).to_s + ":" + minutes
	elsif meridiem == 'am'
			military = hour + ":" + minutes
	end

	return military
end

def military_to_standard(time)
	hour, minutes = time.split(":")
	standard = ""

	if hour.to_i < 12 && hour.to_i != 0
		standard = standard_conversion(hour, minutes) + " am"
	elsif hour.to_i == 0
		hour = (hour.to_i + 12).to_s
		standard = standard_conversion(hour, minutes) + " am"
	elsif hour.to_i == 12
		standard = standard_conversion(hour, minutes) + " pm"
	else
		hour = (hour.to_i - 12).to_s
		standard = standard_conversion(hour, minutes) + " pm"
	end

	return standard
end

def standard_conversion(hour, minutes)
	standard = hour + ':' + minutes
end

def bedtime(time, is_weekday)
	hour, rest = time.split(":")
	minutes, meridiem = rest.split(" ")
	if (hour.to_i >= 8 && is_weekday)
		bedtime = true
  elsif hour.to_i >= 10 && !is_weekday && meridiem == 'pm'
	bedtime = true
	else
		bedtime = false
	end
	return bedtime
end

def span_of_difference_in_year(seconds1, seconds2)
		difference_of_seconds(seconds2, seconds1).to_s + '%'
end

def difference_of_seconds(time1, time2)
	return '%.1f' % (percentage_of_year(time1).to_f - percentage_of_year(time2).to_f).abs
end
