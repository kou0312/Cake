class Order < ApplicationRecord
  belong_to :customer
  has_many :order_details, dependent: :destroy
end
