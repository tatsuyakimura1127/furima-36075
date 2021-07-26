class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
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
    if current_user.id == @item.user_id
      render :edit
    else
      redirect_to user_session_path
    end
  end

  def update
    if  @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :title, :text, :category_id, :status_id, :burden_id,:delivery_id, :days_delivery_id, :price).merge(user_id: current_user.id)
  end
    def set_item
    @item = Item.find(params[:id])
    end
  end
