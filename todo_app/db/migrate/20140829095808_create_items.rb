class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :todo_list
      t.integer :position

      t.timestamps
    end
    add_index :items, :todo_list_id
  end
end
