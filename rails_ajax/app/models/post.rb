class Post < ActiveRecord::Base
  attr_accessible :author, :description, :published_at, :title, :twitter
end
