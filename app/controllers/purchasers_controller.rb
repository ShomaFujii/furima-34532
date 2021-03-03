class PurchasersController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchaser_address = PurchaserAddress.new
    @item = Item.find(params[:item_id])
    unless @item.user_id != current_user.id
      redirect_to root_path
    end
    unless @item.purchaser.nil?
      redirect_to root_path
    end
  end

 
  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    @item = Item.find(params[:item_id])
    if @purchaser_address.valid?
       pay_item
       @purchaser_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:zip_code, :prefecture_id, :city, :street_number, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchaser_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
