OPERATIONS_REGEX = /-?\d+(\+|-|x|\*|\/)-?\d+/

def calculate(num1, operation, num2)
  num1 = num1.to_f
  num2 = num2.to_f

  case operation
  when "+"
    num1 + num2
  when "-"
    num1 - num2
  when "*", "x"
    num1 * num2.round(2)
  when "/"
    num1 / num2.round(2)
  else
    "Invalid operation"
  end
end

loop do
  print "Please enter an equation to calulate: "

  # Break loop if "q" is entered
  break if "q" == equation = Kernel.gets.chomp

  # Isolate equation characters
  equation = equation.split("").keep_if { |elem| elem != " " }

  # Restart loop if an OPERATION is not present in equation
  next if nil == match = OPERATIONS_REGEX.match(equation.join(""))
  op = match[1]

  # Get the index of the OPERATION in the equation
  op_index = match.begin(1)

  first_operator = equation.slice(0, op_index).join("")
  second_operator = equation.slice(op_index + 1, equation.size - 1).join("")

  Kernel.puts "#{first_operator} #{op} #{second_operator} = #{calculate(first_operator, op, second_operator)}"

end
