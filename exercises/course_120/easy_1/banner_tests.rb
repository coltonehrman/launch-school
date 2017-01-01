require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'banner'

class BannerTest < Minitest::Test
  def test_print_banner_with_text
    banner = Banner.new('To boldly go where no one has gone before.')
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    +--------------------------------------------+
    |                                            |
    | To boldly go where no one has gone before. |
    |                                            |
    +--------------------------------------------+
    OUTPUT

    assert_equal(output, banner.to_s)
  end

  def test_print_banner_no_text
    banner = Banner.new('')
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    +--+
    |  |
    |  |
    |  |
    +--+
    OUTPUT
    
    assert_equal(output, banner.to_s)
  end
end
