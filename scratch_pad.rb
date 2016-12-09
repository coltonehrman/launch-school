def reverse(arr)
  arr.inject([]) do |arr, n|
    arr.unshift(n)
  end
end

p reverse([1,2,3])
