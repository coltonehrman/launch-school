def buy_fruit(list)
  list.map do |item|
    items = []
    item[1].times { items << item[0] }
    items
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
