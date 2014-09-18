class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.references :comment

      t.timestamps
    end
    add_index :guests, :comment_id
  end
end
