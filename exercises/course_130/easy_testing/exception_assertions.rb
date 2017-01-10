require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ExceptionTest < Minitest::Test
  class NoExperienceError < Exception; end

  class Employee
    def hire
      raise NoExperienceError
    end
  end

  def test_hire_raises_exception
    employee = Employee.new
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end
