class Item < ApplicationRecord
  
has_one_attached :image
validates :image, presence: true
validates :name, presence: true
validates :description, presence: true
validates :price, presence: true

def add_tax_price
  (self.price * 1.10).round
end
end
