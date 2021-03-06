class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item, only:[:edit,:show,:update,:destroy]
  before_action :set_remove, only:[:edit,:update]

  def index
     @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit

  end

  def destroy
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
    @item.destroy
    redirect_to root_path
  end

  def update
    
    if @item.update(item_params)
      
      redirect_to item_path
    else
      render :edit
    end
 end

  private

  def set_remove
    unless (@item.user_id == current_user.id) && @item.purchaser.nil?
      redirect_to action: :index
    end
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:delivery_date_id,:prefecture_id,:shipping_fee_id,:category_id,:discribe,:condition_id,:name,:image, :price,).merge(user_id: current_user.id)
  end

end


