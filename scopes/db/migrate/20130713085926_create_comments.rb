class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :post
      t.datetime :published_at

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
