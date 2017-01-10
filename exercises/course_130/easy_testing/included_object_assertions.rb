require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedObjectTest < Minitest::Test
  def test_xyz_in_list
    list = ['xyz']
    assert_includes(list, 'xyz')
  end
end
