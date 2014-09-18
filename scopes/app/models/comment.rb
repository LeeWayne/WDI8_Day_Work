class Comment < ActiveRecord::Base
  belongs_to :post
  has_one :guest

  attr_accessible :comment, :post_id, :published_at
end
