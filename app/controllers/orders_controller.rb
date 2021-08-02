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
      @order_residence.save
      redirect_to root_path
    else
      render :index
    end
   end

  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :prefecture, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
