class Order < ApplicationRecord
  has_many :items, through:  :order_histories
  belongs_to :user

  validates :delivery_method,
            :postage,
            :user,
            :ship_address,
            :total_price, 
            presence: true
end
