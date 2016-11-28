require 'yaml'
MESSAGES = YAML.load_file('mortgage_loan.yml')

def parse_options(options); options.split.map { |i| i.to_i } end
def show_welcome_message; Kernel.puts MESSAGES['welcome_message'] end
def show_start_menu; Kernel.puts MESSAGES['start_menu'] end
def prompt; Kernel.print MESSAGES['prompt'] end
def show_input_error; Kernel.puts MESSAGES['input_error'] end
def show_option_error(options); Kernel.puts "#{MESSAGES['option_error']} (#{options.first}-#{options.last})" end

def show_calculator_message; Kernel.puts MESSAGES['calculator_msg'] end
def prompt_loan_amount; Kernel.print MESSAGES['loan_amount_prompt'] end
def prompt_loan_apr; Kernel.print MESSAGES['loan_apr_prompt'] end
def prompt_loan_duration; Kernel.print MESSAGES['loan_duration_prompt'] end
def prompt_calculate_again; Kernel.print MESSAGES['calculate_again_prompt'] end
def show_monthly_payment(monthly_payment); Kernel.puts "#{MESSAGES['monthly_payment_msg']}#{monthly_payment}" end

OPTION_REGEX = %r{^\d+\)?$}
MONEY_REGEX = %r{^\d{1,3}(?:,?\d{3})*(?:\.\d{2})?$}
INTEGER_REGEX = %r{^\d+$}
HAS_INTEGER_REGEX = %r{\d+}
FLOAT_REGEX = %r{^\d*\.?\d*$}

START_MENU_OPTIONS = parse_options MESSAGES['start_menu_options']

def start
  show_welcome_message
  show_start_menu
  option = 0

  loop do
    prompt
    option = Kernel.gets.chomp

    unless option.match OPTION_REGEX
      show_input_error
      next
    end

    unless START_MENU_OPTIONS.include? option.to_i
      show_option_error START_MENU_OPTIONS
      next
    end

    break
  end

  start_calculator if option == '1'
end

def invalid_comma_number(string)
  return false unless string.include? ','
  string.split(',').first.size > 3
end

def get_loan_amount
  loop do
    prompt_loan_amount
    loan_amount = Kernel.gets.chomp

    if !loan_amount.match(MONEY_REGEX) || invalid_comma_number(loan_amount)
      Kernel.puts "Invalid Input"
      next
    end

    return loan_amount.sub(/,/, '').to_f
  end
end

def get_loan_duration
  loop do
    prompt_loan_duration
    loan_duration = Kernel.gets.chomp

    unless loan_duration.match INTEGER_REGEX
      Kernel.puts "Invalid Input"
      next
    end

    return loan_duration.to_i
  end
end

def get_loan_apr
  loop do
    prompt_loan_apr
    loan_apr = Kernel.gets.chomp

    unless loan_apr.match(HAS_INTEGER_REGEX) && loan_apr.match(FLOAT_REGEX)
      Kernel.puts "Invalid Input"
      next
    end

    return loan_apr.to_f
  end
end

def calculate_monthly_payment(amount, apr, duration); amount * ((apr / 100 / 12) / (1 - (1 + (apr / 100 / 12))**(-duration))) end

def start_calculator
  show_calculator_message

  loop do
    loan_amount = get_loan_amount
    loan_duration = get_loan_duration
    loan_apr = get_loan_apr

    monthly_payment = calculate_monthly_payment(loan_amount, loan_apr, loan_duration).round 2
    show_monthly_payment monthly_payment

    prompt_calculate_again
    answer = Kernel.gets.chomp

    break if answer.downcase.start_with? 'n'
  end

  start
end

start
