# start with x number of lights switched on
#   cycle through the lights for x amount of times
#   first cycle will start with 2 and go through every light divisble by that number
#   second cycle will be 3 and go through every light divisble by that number
#   ...
#   and so on until you reach x number of cycles

lights = (1..1000).zip(1000.times.map { true }).to_h

(2..(lights.count)).each do |n|
  lights.each { |light, on| lights[light] = !on if light % n == 0 }
end

p (lights.select { |_, on| on }.keys) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
