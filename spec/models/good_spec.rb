require 'rails_helper'

RSpec.describe Good, type: :model do
  before do
    @user = FactoryBot.create(:user) # FactoryBotを使用してユーザーを作成
    @good = FactoryBot.build(:good, user: @user)
  end

  describe '商品出品登録' do

    context '商品出品ができない時' do
      it 'nameが空では登録できない' do
        @good.name = ''
        @good.valid?
        expect(@good.errors.full_messages).to include "Name can't be blank"
      end

      it 'name_explanationが空では登録できない' do
        @good.name_explanation = ''
        @good.valid?
        expect(@good.errors.full_messages).to include "Name explanation can't be blank"
      end

      it 'category_idが空では登録できない' do
        @good.category_id = '1'
        @good.valid?
        expect(@good.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが空では登録できない' do
        @good.condition_id = '1'
        @good.valid?
        expect(@good.errors.full_messages).to include "Condition can't be blank"
      end

      it 'delivery_idが空では登録できない' do
        @good.delivery_id = '1'
        @good.valid?
        expect(@good.errors.full_messages).to include "Delivery can't be blank"
      end

      it 'aria_idが空では登録できない' do
        @good.aria_id = '1'
        @good.valid?
        expect(@good.errors.full_messages).to include "Aria can't be blank"
      end

      it 'shipment_idが空では登録できない' do
        @good.shipment_id = '1'
        @good.valid?
        expect(@good.errors.full_messages).to include "Shipment can't be blank"
      end

      it 'priceが空では登録できない' do
        @good.price = ''
        @good.valid?
        expect(@good.errors.full_messages).to include "Price can't be blank"
      end

      it "価格に半角数字以外が含まれている場合は出品できない" do
        @good.price = "123a"
        @good.valid?
        expect(@good.errors.full_messages).to include("Price is not a number")
      end

      it "価格が300円未満では出品できない" do
        @good = Good.new(price: 299, user: @user)
        @good.valid?
        expect(@good.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が9,999,999円を超えると出品できない" do
        @good = Good.new(price: 10_000_000, user: @user)
        @good.valid?
        expect(@good.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "userが紐付いていなければ出品できない" do
        @good = Good.new(price: 1000)
        @good.valid?
        expect(@good.errors.full_messages).to include("User must exist")
      end

      it 'imageが空では登録できない' do
        @good.image = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Image can't be blank")
      end
    end

    context '商品出品ができる時' do
      it '全ての属性が正しければ登録できる' do
        expect(@good).to be_valid
      end
    end


    
  end
end