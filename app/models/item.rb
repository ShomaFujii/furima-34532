class Item < ApplicationRecord

belongs_to :user
has_one_attached :image

with_options presence: true do
  validates :name
  validates :discribe
  validates :price
end

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  validates :genre_id, numericality: { other_than: 1 }
  
end
