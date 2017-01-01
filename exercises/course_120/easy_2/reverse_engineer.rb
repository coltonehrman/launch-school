class Transform
  class << self
    def lowercase(data)
      data.downcase
    end
  end

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def uppercase
    data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
