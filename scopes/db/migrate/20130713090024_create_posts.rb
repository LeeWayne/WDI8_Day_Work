class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.references :category
      t.datetime :published_at

      t.timestamps
    end
    add_index :posts, :category_id
  end
end
