class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :order_items
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :active, presence:true
  validates :image, presence: true

end
