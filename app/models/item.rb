class Item < ApplicationRecordhas_many :orders,
  has_many :images, dependent: :destroy
  has_many :orders, through:  :order_histories
  has_many :users, through:  :favorites
  belongs_to :category
  
  accepts_nested_attributes_for :images, allow_destroy: true

end
