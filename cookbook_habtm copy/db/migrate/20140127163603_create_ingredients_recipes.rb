class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes, id: false do |t|
      t.references :recipe
      t.references :ingredient
    end
  end
end
