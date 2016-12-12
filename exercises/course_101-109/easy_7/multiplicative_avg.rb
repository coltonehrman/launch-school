def show_multiplicative_average(nums)
  puts "The result is #{'%.3f' % (nums.reduce(&:*).to_f / nums.count)}"
end

show_multiplicative_average([3, 5])
# => The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# => The result is 28361.667
