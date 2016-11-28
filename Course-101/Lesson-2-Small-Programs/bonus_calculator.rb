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

def isolate_chars(string)
  string.split('').reject { |char| char == ' ' }
end

loop do
  Kernel.print 'Please enter an equation to calulate ("q" or "x" to quit): '

  eq = Kernel.gets.chomp
  break if 'qx'.include? eq.downcase

  eq_chars = isolate_chars eq
  eq = eq_chars.join('')

  match = EQUATION_REGEX.match(eq)
  if match.nil?
    Kernel.puts "\n\t**INVALID EQUATION WAS ENTERED!**\n\n"
    next
  end

  op = match.captures.first
  op_start_index = match.offset(1)[0]
  op_end_index = match.offset(1)[1]

  first_operator = eq_chars.slice(0, op_start_index).join('')
  second_operator = eq_chars.slice(op_end_index, eq_chars.size - 1).join('')

  Kernel.puts "=> #{first_operator} #{op} #{second_operator} =\
 #{calc(first_operator, op, second_operator)}\n\n"
end
