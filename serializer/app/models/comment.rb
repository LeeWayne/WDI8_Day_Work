class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :content, :first_name, :last_name, :post_id
end
