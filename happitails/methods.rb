def adopt_animal(shelter)
  puts shelter.display_animals
  puts
  prints "Which animal would you like to adopt (by name): "
  animal_name = gets.chomp

  puts shelter.display_clients
  puts
  prints "Which client is going to (by name): "
  client_name = gets.chomp

   shel
end

binding.pry
def create_client(shelter)
  print 'Name: '
  name = gets.chomp

  print 'Age: '
  age = gets.to_i

  print 'Sex (m/f): '
  sex = gets.chomp

  print 'Children (number)?'
  children = gets.to_i

  shelter.clients[names.to_sym] = Person.new(name: name, sex: sex, children: children)
end


def menu
  puts `clear`
  puts "***HappiTails Animal Shelter Fluffyware***\n\n"

  puts '1 : List Animals'
  puts '2 : List Clients'
  puts '3 : Create Animal'
  puts '4 : Create Client'
  puts '5 : Adopt Animal'
  puts '6 : Abandon Animal'
  puts
  puts '0 : quit'
  print '-->'
  gets.chomp.to_i

end