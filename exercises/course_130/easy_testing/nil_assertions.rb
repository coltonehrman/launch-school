require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test
  def test_value_is_nil
    value = nil
    assert_nil(value)
  end
end
