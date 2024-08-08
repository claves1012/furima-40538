require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @orderpayment = FactoryBot.build(:order_payment, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it "post_code、prefecture_id、city、block、phone_number、token、user_id、item_idが存在すれば登録できる" do
        expect(@orderpayment).to be_valid
      end
      it "buildingが空でも登録できる" do
        @orderpayment.building = ''
        expect(@orderpayment).to be_valid
      end

    end
    context '商品が購入できない場合' do
      it "tokenが空では購入できない" do
        @orderpayment.token = nil
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空では購入できない" do
        @orderpayment.post_code = ''
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが3桁ハイフン4桁の半角英数字以外では購入できない" do
        @orderpayment.post_code = '1234-5678'
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Post code is invalid. Input in the format '3-digits-4-digits'.")
      end
      it "post_codeにハイフンを含まなければ購入できない" do
        @orderpayment.post_code = '1234567'
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Post code is invalid. Input in the format '3-digits-4-digits'.")
      end
      it "prefecture_idが選択されていなければ購入できない" do
        @orderpayment.prefecture_id = 1
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できない" do
        @orderpayment.city = ''
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空では購入できない" do
        @orderpayment.block = ''
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @orderpayment.phone_number = ''
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが10桁未満の半角数字では購入できない" do
        @orderpayment.phone_number = '123456789'
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Phone number is invalid. Input a 10 to 11 digit number.")
      end
      it "phone_numberが12桁以上の半角英数字では購入できない" do
        @orderpayment.phone_number = '123456789012'
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Phone number is invalid. Input a 10 to 11 digit number.")
      end
      it "phone_numberが数字以外では購入できない" do
        @orderpayment.phone_number = 'abcdefghij'
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Phone number is invalid. Input a 10 to 11 digit number.")
      end
      it "user_idが空では購入できない" do
        @orderpayment.user_id = ''
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @orderpayment.item_id = ''
        @orderpayment.valid?
        expect(@orderpayment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
