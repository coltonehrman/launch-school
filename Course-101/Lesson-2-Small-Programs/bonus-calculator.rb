EQUATION_REGEX = %r{^-?\d*\.?\d*(\+|-|x|\*\*?|/)-?\d*\.?\d*$}

def calc(num1, op, num2)
  num1 = num1.to_f
  num2 = num2.to_f
  case op
    when '+' then num1 + num2
    when '-' then num1 - num2
    when '*', 'x' then num1 * num2
    when '**' then num1**num2
    when '/' then num1 / num2.to_f
  end
end

def isolate_characters(string)
  string.split('').reject { |char| char == ' ' }
end

loop do
  Kernel.print 'Please enter an equation to calulate ("q" or "x" to quit): '

  equation = Kernel.gets.chomp
  break if 'qx'.include? equation.downcase

  equation_chars = isolate_characters equation
  equation = equation_chars.join('')

  match = EQUATION_REGEX.match(equation)
  if match.nil?
    Kernel.puts "\n\t**INVALID EQUATION WAS ENTERED!**\n\n"
    next
  end

  op = match.captures.first

  op_start_index = match.offset(1)[0]
  op_end_index = match.offset(1)[1]

  first_operator = equation_chars.slice(0, op_start_index).join('')
  second_operator = equation_chars.slice(op_end_index, equation.size - 1).join('')

  Kernel.puts "=> #{first_operator} #{op} #{second_operator} =\
 #{calc(first_operator, op, second_operator)}\n\n"
end
