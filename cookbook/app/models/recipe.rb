class Recipe < ActiveRecord::Base
  attr_accessible :instuctions, :published_on, :title, :category_id

  belongs_to :category

end
