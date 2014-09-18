class Order < ActiveRecord::Base
  attr_accessible :customer_id, :value
  atter_accessor :card_number, :payment_type

  belongs_to :customer

  validates :value, numericality: true

  validates :card_number, presence: true, if: :paid_with_card? on: :update

  validate :active_customer, on: :create

  def paid_with_card?
    pyment_type == 'card'
  end

  def active_customer
    errrors.add(:customer_id, "is not active") unless customer.active?
  end

end
