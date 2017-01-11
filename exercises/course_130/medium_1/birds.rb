def birds(arr)
  yield(arr)
end

birds(%w(raven finch hawk eagle)) do |_, _, *bird_of_prey|
  p bird_of_prey
end
