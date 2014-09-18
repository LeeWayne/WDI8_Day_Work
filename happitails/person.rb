class Person

  attr_accessor :name, :age, :sex, :children, :pets

  def initialize(options={})
    self.name = options[:name]
    self.age = options[:age]
    self.sex = options[:sex]
    self.children = options[:children]
    self.pets = {}
  end
  
  def pretty_string
    self.inspect
  end

end