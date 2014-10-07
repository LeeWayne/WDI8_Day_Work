class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :twitter
      t.datetime :published_at

      t.timestamps
    end
  end
end
