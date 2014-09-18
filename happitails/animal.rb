class Animal

  attr_accessor :name, :age, :sex, :fave_toy
  attr_reader   :species, :breed

  def initialize(options={})
    self.name = options[:name]
    self.age = options[:age]
    self.sex = options[:sex]
    self.fave_toy = options[:fave_toy]
    @species = options[:species]
    @breed = options[:breed]
  end

  def pretty_string
    "#{name} is a #{age} year old #{breed} #{species}. #{name}'s favourite toy is #{fave_toy}"
  end

end