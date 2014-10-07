class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  attr_accessible :content, :title, :author_id
end
