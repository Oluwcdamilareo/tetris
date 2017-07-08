class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :order_items

  enum status: [:active, :featured]

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :image, presence: true

  def self.search(search)
  if search
    where(['name LIKE ?', "%#{search}%"])
  else
    all
  end
end

end
