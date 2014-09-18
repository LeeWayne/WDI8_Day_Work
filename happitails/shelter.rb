class Shelter

  attr_accessor :animals, :name, :clients, :address

  def initialize(name, address)
    self.name    = name
    self.address = address
    self.animals = {}
    self.clients = {}
  end
   
  def adopt(client_name, animal_name)
    client_key = client_name.downcase.to_sym
    animal_key = animal_name.downcase.to_sym

    client = clients[client_key]
    client.pets[animal_key] = animals.delete(animal_key)
  end

  def display_animals
    if animals.empty?
      'There are no animals in the shelter at the moment'
    else
      animals.map do |key, animals|
        animals.pretty_string
      end
    end
  end

  def display_clients
    if clients.empty?
      'There are no animals in the shelter at the moment'
    else
       clients.map do |key, client|
       client.pretty_string
      end
    end
  end

end