class Customer < ActiveRecord::Base
  attr_accessible :address, :age, :name

  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, uniqueness: true

end
