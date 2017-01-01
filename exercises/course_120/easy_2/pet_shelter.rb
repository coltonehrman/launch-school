class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt(pet)
    @pets << pet
  end

  def display_pets
    output = "#{name} has adopted the following pets:\n"
    @pets.each do |pet|
      output += "a #{pet.type} named #{pet.name}\n"
    end
    output
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @pet_owners = []
  end

  def adopt(owner, pet)
    @pet_owners << owner unless @pet_owners.include?(owner)
    owner.adopt(pet)
  end

  def print_adoptions
    @pet_owners.each do |owner|
      puts owner.display_pets
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
