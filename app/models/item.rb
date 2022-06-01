class Item < ApplicationRecord
  has_one_attached :image

  belong_to :genre
  
  has_many :cart_items
end
