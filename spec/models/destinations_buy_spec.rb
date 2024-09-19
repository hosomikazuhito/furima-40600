require 'rails_helper'

RSpec.describe DestinationsBuy, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @good = FactoryBot.create(:good, user: @user)
    @destinations_buy = FactoryBot.build(:destinations_buy, user_id: @user.id, good_id: @good.id)
  end

  describe '商品購入登録' do
    context '商品購入ができない時' do
      it 'post_codeが空では登録できない' do
        @destinations_buy.post_code = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include "Post code can't be blank"
      end

      it 'aria_idが空では登録できない' do
        @destinations_buy.aria_id = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include "Aria can't be blank"
      end

      it 'municipalitiesが空では登録できない' do
        @destinations_buy.municipalities = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include "Municipalities can't be blank"
      end

      it 'streetが空では登録できない' do
        @destinations_buy.street = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include "Street can't be blank"
      end

      it 'telephoneが空では登録できない' do
        @destinations_buy.telephone = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include "Telephone can't be blank"
      end

      it '電話番号に半角数字以外が含まれている場合は登録できない' do
        @destinations_buy.telephone = '123-4567-890'
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include("Telephone is invalid. Input only number")
      end

      it 'userが紐付いていなければ購入できない' do
        @destinations_buy.user_id = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include("User can't be blank")
      end

      it 'goodが紐付いていなければ購入できない' do
        @destinations_buy.good_id = ''
        @destinations_buy.valid?
        expect(@destinations_buy.errors.full_messages).to include("Good can't be blank")
      end
    end

    context '商品購入ができる時' do
      it '全ての属性が正しければ登録できる' do
        expect(@destinations_buy).to be_valid
      end
    end
  end
end