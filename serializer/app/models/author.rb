class Author < ActiveRecord::Base
  has_many :posts
  attr_accessible :biography, :email, :first_name, :last_name

  def name
    [first_name, last_name].delete_if(&:blank?).join(' ')
  end
end
