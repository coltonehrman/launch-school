# Time of day after midnight
#   input:
#     - minutes
#     - positive or negative
#     - negative input is minutes before midnight
#     - postive input is minutes after midnight
#   output:
#     - time of day in 24 hour format
#     - 24 hour format Ex. "24:02" (hours:minutes)
#     - midnight is 00:00
#     - extra zero
#   model:
#     - given a number in minutes either positive or negative
#     - output that number of minutes either past or before midnight
#     -
#     - get the hours from minutes by dividing by 60
#     - get the remaining minutes by subtracting the hours from minutes
#       - while hours is greater than 24 subtract 24 from hours
#       - if input is negative then subtract hours from 23 and minutes from 60
#       - output will be hours and minutes seperated by colon

def time_of_day(input)
  hours, minutes = input.abs.divmod(60)

  while hours > 24
    hours -= 24
  end

  if input < 0
    hours = 23 - hours
    minutes = 60 - minutes
  end

  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Minutes after midnight
#   input:
#     - 24 hour format time of day
#     - Ex. "12:34"
#     - leading zeros
#   output:
#     - minutes after midnight based on time of day
#     - midnight is 00:00 and 24:00
#   model:
#     - extract the hours and minutes from input with a split on ":"
#     - turn the hours into minutes and add with the rest for a total
#     - return total

def after_midnight(time)
  hours, min = time.split(':').map(&:to_i)
  min += hours * 60
  return 0 if hours == 24
  min
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

# Minutes before midnight
#   input:
#     - 24 hour format time of day
#     - Ex. "12:34"
#     - leading zeros
#   output:
#     - minutes after midnight based on time of day
#     - midnight is 00:00 and 24:00
#   model:
#     - extract the hours and minutes from input with a split on ":"
#     - subtract hours from 24
#     - turn the hours into minutes and add with the rest for a total
#     - return total

def before_midnight(time)
  hours, min = time.split(':').map(&:to_i)
  hours -= 24
  min += hours * 60
  return 0 if hours == 24
  min
end

before_midnight('00:00') == 0
before_midnight('12:34') == 686
before_midnight('24:00') == 0
