class Movie < ActiveRecord::Base
  attr_accessible :title, :genre, :year
end