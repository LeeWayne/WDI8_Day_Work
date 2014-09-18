class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  attr_accessible :content, :title, :category, :category_id
end
