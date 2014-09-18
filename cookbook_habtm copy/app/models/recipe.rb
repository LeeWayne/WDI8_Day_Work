class Recipe < ActiveRecord::Base
  attr_accessible :name, :instructions, :category_id, :description, :ingredient_ids

  belongs_to :category

  validates :name, presence: true

  has_and_belongs_to_many :ingredients
end
