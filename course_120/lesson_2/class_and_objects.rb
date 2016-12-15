class Person

  attr_accessor :name, :first_name, :last_name

  def initialize(name)
    self.name = name
  end

  def name
    "#{self.first_name} #{self.last_name}".strip
  end

  def name=(name)
    @first_name, @last_name = name.split
    @last_name ||= ''
  end

  def to_s
    self.name
  end

end

bob = Person.new('bob')
p bob.name == 'bob'
bob.name = 'Robert'
p bob.name == 'Robert'

bob = Person.new('Robert')
p bob.name == 'Robert'
p bob.first_name == 'Robert'
p bob.last_name == ''
bob.last_name = 'Smith'
p bob.name == 'Robert Smith'

bob = Person.new('Robert')
p bob.name == 'Robert'
p bob.first_name == 'Robert'
p bob.last_name == ''
bob.last_name = 'Smith'
p bob.name == 'Robert Smith'

bob.name = "John Adams"
p bob.first_name == 'John'
p bob.last_name == 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
