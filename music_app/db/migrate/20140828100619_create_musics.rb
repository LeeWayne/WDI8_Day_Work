class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.integer :members
      t.string :genre
      t.string :popular_song

      t.timestamps
    end
  end
end
