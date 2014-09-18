class Guest < ActiveRecord::Base
  belongs_to :comment

  attr_accessible :name, :comment_id
end
