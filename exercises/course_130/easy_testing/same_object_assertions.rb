require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class SameObjectTest < Minitest::Test
  def test_same_objects
    assert_same({}, {})
  end
end
