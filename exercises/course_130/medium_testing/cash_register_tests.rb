require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money_method
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change_method
    register = CashRegister.new(1000)
    transaction = Transaction.new(9.99)
    transaction.amount_paid = 20

    change = register.change(transaction)

    assert_equal(20 - 9.99, change)
  end

  def test_give_receipt_method
    register = CashRegister.new(1000)
    transaction = Transaction.new(9.99)
    transaction.amount_paid = 20

    assert_output("You've paid $#{transaction.item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end
