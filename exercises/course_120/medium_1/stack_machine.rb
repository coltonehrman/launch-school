class Minilang
  VALID_COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(commands)
    @commands = commands.split
    @empty = false
    @register = 0
    @stack = []
  end

  def eval
    if invalid_commands.empty?
      @commands.each do |command|
        if @empty
          puts "Empty stack!"
          break
        end
        if is_int?(command)
          @register = command.to_i
        else
          run_command(command)
        end
      end
    else
      puts "Invalid token: #{invalid_commands.join(', ')}"
    end
    puts ""
  end

  private

  def invalid_commands
    commands = @commands.clone
    commands.delete_if do |command|
      is_int?(command) || VALID_COMMANDS.include?(command)
    end
    commands
  end

  def run_command(command)
    case command.upcase
    when 'PRINT'
      puts @register
    when 'PUSH'
      @stack << @register
    else
      if @stack.empty?
        @empty = true
        return
      end
      pop_then_run_command(command)
    end
  end

  def pop_then_run_command(command)
    popped = @stack.pop
    case command.upcase
    when 'ADD'
      @register += popped
    when 'SUB'
      @register -= popped
    when 'MULT'
      @register *= popped
    when 'DIV'
      @register /= popped
    when 'MOD'
      @register %= popped
    else
      @register = popped
    end
  end

  def is_int?(command)
    command.to_i.to_s == command
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
