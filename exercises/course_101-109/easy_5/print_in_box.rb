CORNER = '+'
HORIZONTAL_BORDER = '-'
VERTICAL_BORDER = '|'

def print_in_box(text)
  puts "#{CORNER}#{HORIZONTAL_BORDER * (text.length + 2)}#{CORNER}"
  puts "#{VERTICAL_BORDER}#{' ' * (text.length + 2)}#{VERTICAL_BORDER}"
  puts "#{VERTICAL_BORDER} #{text} #{VERTICAL_BORDER}"
  puts "#{VERTICAL_BORDER}#{' ' * (text.length + 2)}#{VERTICAL_BORDER}"
  puts "#{CORNER}#{HORIZONTAL_BORDER * (text.length + 2)}#{CORNER}"
end

print_in_box('')
