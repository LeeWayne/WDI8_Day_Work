class TodoList < ActiveRecord::Base
  attr_accessible :name
  has_many :items, order: :position

end
