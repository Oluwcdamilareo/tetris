class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_items
  has_one :cart
  before_save :update_subtotal
  enum status: [:progress, :placed, :delivered, :cancelled]


  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end


private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
