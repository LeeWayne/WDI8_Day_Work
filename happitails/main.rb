require 'pry-byebug'

require_relative 'shelter'
require_relative 'animal'
require_relative 'person'
require_relative 'menu'

shelter = Shelter.new("Lee's Farm", "Cambridge")

shelter.clients[:anand] = Person.new(name: 'Anand', sex: 'm', children: 2, age: 25)

shelter.animals[:barley] = Animal.new(name: 'Barley', age: 7, fave_toy: 'ball', sex: 'f', species: 'dog', breed: 'gsdx')
shelter.animals[:star] = Animal.new(name: 'star', age: 5, fave_toy: 'water', sex: 'f', species: 'dog', breed: 'gsd')
shelter.animals[:star] = Animal.new(name: 'star', age: 5, fave_toy: 'mouse', sex: 'm', species: 'cat', breed: 'tabby')

response = menu

while response != 0
  case response
  when 1
    puts shelter.display_animals
  when 2 
    puts shelter.diplay_clients
  when 4
    new_person = create_client(shelter)  
    puts "#{new_person.name} was created"
  when 5
    adopt_animal(shelter)
  else
    puts 'invalid option'
  end

  puts 'press enter to continue'
  gets 
  response = menu
end

#binding.pry