require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityTest < Minitest::Test
  def test_value_downcase_is_xyz
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
