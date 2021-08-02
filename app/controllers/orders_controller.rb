class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  # include ActiveModel::Model
  # attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number
  
  def index
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render :index
   end
 end

 private
  
  def pay_item
        Payjp.api_key = "sk_test_5b1e00d9f97acda91fa8b230"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  

  def order_params
    params.require(:order_residence).permit(:postal_code, :prefecture, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
