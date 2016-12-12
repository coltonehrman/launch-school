def sub_float(num1, num2)
  ((num1 * 100) - (num2 * 100)) / 100
end

def dms(degrees)
  minutes = sub_float(degrees, degrees.to_i.to_f) * 60
  seconds = sub_float(minutes, minutes.to_i.to_f) * 60
  degrees = degrees.to_i
  minutes = minutes.to_i
  seconds = seconds.to_i
  %(#{degrees}°#{minutes.to_s.rjust(2, '0')}'#{seconds.to_s.rjust(2, '0')}")
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
