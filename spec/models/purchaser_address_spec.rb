require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchaser_address = FactoryBot.build(:purchaser_address, user_id: user.id,item_id: item.id)
      sleep(0.5)
    end  

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchaser_address).to be_valid
    end
    it 'buildingが空でも登録できる' do
      @purchaser_address.building = ""
      expect(@purchaser_address).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @purchaser_address.token = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'zip_codeが空だと保存できないこと' do
      @purchaser_address.zip_code = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'prefecture_idが0だと保存できないこと' do
      @purchaser_address.prefecture_id = 0
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchaser_address.city = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
    end
    it 'street_numberが空だと保存できないこと' do
      @purchaser_address.street_number = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Street number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchaser_address.phone_number = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'zip_codeがハイフンを含んでいないと保存できないこと' do
      @purchaser_address.zip_code = '1234567'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
    end
    it '電話番号は10桁以内の数値では保存できないこと' do
      @purchaser_address.phone_number = '0900989887'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number is invalid. without hyphen(-)")
    end
    it '電話番号は12桁以上の数値では保存できないこと' do
      @purchaser_address.phone_number = '090098988783'
      @purchaser_address.valid?

      expect(@purchaser_address.errors.full_messages).to include("Phone number is invalid. without hyphen(-)")
    end
    it '電話番号はハイフンを含んでいれば保存できないこと' do
      @purchaser_address.phone_number = '090-3456-3456'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number is invalid. without hyphen(-)") 
    end
  end
end
