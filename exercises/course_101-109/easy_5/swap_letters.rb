def swap_indeces(str, i)
  str = str.clone
  temp = str[i[0]]
  str[i[0]] = str[i[1]]
  str[i[1]] = temp
  str
end

def swap(str)
  str.split.map { |s| swap_indeces(s, [0, -1]) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
