class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instuctions
      t.date :published_on

      t.timestamps
    end
  end
end
