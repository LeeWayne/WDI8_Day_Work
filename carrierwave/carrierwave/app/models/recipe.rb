class Recipe < ActiveRecord::Base
  attr_accessible :name, :recipe_image
  mount_uploader :recipe_image, RecipeImageUploader
end
