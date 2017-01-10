require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindTest < Minitest::Test
  def test_value_is_a_kind_of_numeric
    value = 5
    assert_kind_of(Numeric, value)
  end
end
