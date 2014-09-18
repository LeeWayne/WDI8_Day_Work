class Music < ActiveRecord::Base
  attr_accessible :genre, :members, :name, :popular_song, :music_image
  mount_uploader :music_image, MusicImageUploader
end
