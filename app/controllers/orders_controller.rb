class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
  
  def index
    @order_residence = OrderResidence.new
  end

  def create
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
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
        Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],   
        currency: 'jpy'                 
      )
  end

  def order_params
    params.require(:order_residence).permit(:postal_code, :prefecture, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
    end
   end
 end

