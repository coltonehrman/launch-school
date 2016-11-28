EQUATION_REGEX = %r{-?\d+(\+|-|x|\*|\/)-?\d+}

def calc(num1, op, num2)
  num1 = num1.to_i
  num2 = num2.to_i
  case op
  when '+' then num1 + num2
  when '-' then num1 - num2
  when '*', 'x' then num1 * num2
  when '/' then num1 / num2.to_f
  end
end

loop do
  Kernel.print 'Please enter an equation to calulate ("q" to quit): '

  # Break loop if "q" is entered
  equation = Kernel.gets.chomp
  break if equation == 'q'

  # Isolate equation characters
  equation = equation.split('').keep_if { |elem| elem != ' ' }

  # Restart loop if an OPERATION is not present in equation
  match = EQUATION_REGEX.match(equation.join(''))
  if match.nil?
    Kernel.puts "\n\t**INVALID EQUATION WAS ENTERED!**\n\n"
    next
  end

  # Get operation from regex match
  op = match[1]

  # Get the index of the operation in the equation
  op_index = match.begin(1)

  first_operator = equation.slice(0, op_index).join('')
  second_operator = equation.slice(op_index + 1, equation.size - 1).join('')

  Kernel.puts "#{first_operator} #{op} #{second_operator} =\
 #{calc(first_operator, op, second_operator)}"
end
