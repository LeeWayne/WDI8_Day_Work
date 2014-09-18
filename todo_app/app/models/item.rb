class Item < ActiveRecord::Base
  belongs_to :todo_list
  attr_accessible :name, :position

  acts_as_list scope: :todo_list

end
