require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'user,product_name,description,category_id,status_id,burden_id,delivery_id,days_delivery_id,priceがあれば保存できること' do
      expect(@item).to be_valid
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  
    it 'product_nameが空では登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では登録できない' do
      @item.status_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'burden_idが空では登録できない' do
      @item.burden_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it 'delivery_idが空では登録できない' do
      @item.delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    it 'days_delivery_idが空では登録できない' do
      @item.days_delivery_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days delivery can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end


