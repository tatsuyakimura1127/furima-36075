require 'rails_helper'

RSpec.describe Item, type: :model do

    before do
      @item = FactoryBot.build(:item)
    end
    
describe '商品出品機能' do
  context '商品出品できるとき' do
    it '必須項目が全てあれば保存できること' do
      expect(@item).to be_valid
    end
    it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
      @item = FactoryBot.create(:user)
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image.key = ''
      @item.valid?
      expect(@item.errors.full_messages).to include{"Image can't be blank"}
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
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では登録できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'burden_idが空では登録できない' do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it 'delivery_idが空では登録できない' do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    it 'days_delivery_idが空では登録できない' do
      @item.days_delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days delivery can't be blank")
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが設定範囲以外だと出品できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceが全角数字だと出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price Half-width number")
    end
   end
  end
 end