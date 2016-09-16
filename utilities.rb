
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

def convert2(x)
	a, b = x.split(":")
	c = ""

	if a.to_i < 12
		c = a + b + " am"
	else
		c = a + b + " pm"
	end

	return c
end

def okay(a, b)
	c = false
	if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
		c = false
	else
		c = true
	end
	return c
end

def span(a, b)
	c = 0
	d = 0
	if a < b
		c = b
		d = a
	else
		c = a
		d = b
	end

	return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
end
