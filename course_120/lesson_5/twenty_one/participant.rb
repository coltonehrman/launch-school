class Participant
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end

  def to_s
    name
  end
end
