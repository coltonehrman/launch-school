vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
  list = arr.uniq.map do |item|
    { name: item, count: arr.count(item) }
  end

  list.each { |item| puts "#{item[:name]} => #{item[:count]}" }
end

count_occurrences(vehicles)
