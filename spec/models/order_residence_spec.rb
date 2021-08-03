require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  before do
    @order_residence = FactoryBot.build(:order_residence)
  end

  context '内容に問題ない場合' do
    it "user_id,item_id,municipality,address,phone_number,postal_code,prefecture,tokenがあれは保存できること" do
      expect(@order_residence).to be_valid
    end
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

    it "postal_codeが空では登録できないこと" do
      @order_residence.postal_code = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
    end

    it "prefectureが空では登録できないこと" do
      @order_residence.prefecture = nil
      @order_residence.valid?
      expect(@order_residence.errors.full_messages).to include("Prefecture can't be blank")
    end
  end
end
