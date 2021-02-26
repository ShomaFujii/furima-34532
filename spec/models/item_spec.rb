require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品の保存' do
    context '商品が投稿できる場合' do
        it '画像とテキストがあれば投稿できる' do
          expect(@item).to be_valid
        end
     end
    context '商品が投稿できない場合' do
      it '商品名が空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end  
      it '画像が空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 
      it '説明文が空では投稿できない' do
        @item.discribe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Discribe can't be blank")
      end 
      it '状態が空では投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end 
      it 'カテゴリーが空では投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end 
      it '配送料金が空では投稿できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end 
      it '配送エリアが空では投稿できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end  
      it '配送日程が空では投稿できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end    
      it '価格が空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it '価格が全角数字では投稿できない' do
        @item.price = '２４４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it '価格が全角文字では投稿できない' do
        @item.price = '文字'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it '半角英混合では投稿できない' do
        @item.price = '1234acb'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it '半角英語では投稿できない' do
        @item.price = 'acb'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it '価格が299以下では投稿できない' do
        @item.price = 234
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end 
      it '価格が10000000以上では投稿できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end 
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')


      end
      
    end
  end

end
