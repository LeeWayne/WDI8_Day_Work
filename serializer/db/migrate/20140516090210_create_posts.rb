class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :author
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
