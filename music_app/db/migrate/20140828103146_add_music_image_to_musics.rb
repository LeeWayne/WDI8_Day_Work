class AddMusicImageToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :music_image, :string
  end
end
