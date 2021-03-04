class Item < ApplicationRecord

belongs_to :user
has_one_attached :image
has_one :purchaser

with_options presence: true do
  validates :name
  validates :image
  validates :discribe
  validates :price,numericality: { greater_than:299 , less_than: 10000000},format:{with: /\A[0-9]+\z/}
end

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :category
  belongs_to :shippingFee
  belongs_to :deliveryDate

  validates :condition_id,:category_id ,:shipping_fee_id,:delivery_date_id, numericality: { other_than: 1 }

  validates :prefecture_id ,numericality: { other_than: 0 }
  
end

