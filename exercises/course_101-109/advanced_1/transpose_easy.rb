def transpose(matrix)
  columns = []
  matrix.count.times do |i|
    columns << []
    matrix.each.with_index do |col, col_i|
      columns[i] << col[i]
    end
  end
  columns
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
