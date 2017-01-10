require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def test_value_is_numeric
    value = 5
    assert_instance_of(Numeric, value)
  end
end
