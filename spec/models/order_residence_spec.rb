require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_residence = FactoryBot.build(:order_residence, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end


  context '内容に問題ない場合' do
    it "user_id,item_id,municipality,address,phone_number,postal_code,prefecture,tokenがあれは保存できること" do
      expect(@order_residence).to be_valid
    end

    it "building_nameが空でも購入できること" do
      @order_residence.building_name = nil
      expect(@order_residence).to be_valid
    end


  context '内容に問題がある場合' do
    it "user_idが空では保存ができないこと" do
      @order_residence.user_id = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @order_residence.item_id = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Item can't be blank")
    end

    it "postal_codeが空では登録できないこと" do
      @order_residence.postal_code = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeにハイフンがないと登録できないこと" do
      @order_residence.postal_code = '1231234'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Postal code is invalid")
    end

    it "postal_codeは3桁-4桁でなければ登録できないこと" do
      @order_residence.postal_code = '2221-22222'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Postal code is invalid")
     end

    it "delivery_idが空では登録できないこと" do
      @order_residence.delivery_id = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Delivery id can't be blank")
    end

    it "municipalityが空では保存ができないこと" do
      @order_residence.municipality = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Municipality can't be blank")
    end

    it "addressが空では登録できないこと" do
      @order_residence.address = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では保存ができないこと" do
      @order_residence.phone_number = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が12桁以上では登録できないこと" do
      @order_residence.phone_number = '2324545654754'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号が数字のみでないと登録できないこと" do
      @order_residence.phone_number = '090-9090-1212'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号が全角文字では登録できないこと" do
      @order_residence.phone_number = '１２３４５６７８９１'
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
     end

    it "tokenが空では登録できないこと" do
      @order_residence.token = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end


