require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyObjectTest < Minitest::Test
  def test_list_is_not_empty
    list = []
    assert_empty(list)
  end
end
