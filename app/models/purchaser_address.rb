class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street_number, :building, :phone_number,,:user_id,:item_id,:token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :street_number
    validates :token
    validates :zip_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{,11}\z/, message: "is invalid. without hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  def save
    # 寄付情報を保存し、変数donationに代入する
    purchaser = Purchaser.create( user_id: user_id ,item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building,phone_number: phone_number, purchaser_id: purchaser.id)
  end
end
