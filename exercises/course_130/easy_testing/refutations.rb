require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RefutationTest < Minitest::Test
  def test_refutations
    list = ['a']
    refute_includes(list, 'xyz')
  end
end
