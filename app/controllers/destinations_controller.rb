class DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_good, only: [:index, :create]
  before_action :redirect_if_purchased, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]
  

  require 'payjp'

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @good = Good.find(params[:good_id])
    @destination_buy = DestinationsBuy.new
    @destination = Destination.new
  end

  def new
    @destination_buy = DestinationsBuy.new
  end

  def create
    @destination_buy = DestinationsBuy.new(destination_buy_params)
    @good = Good.find(params[:good_id])
  
    if @destination_buy.valid?
      begin
        ActiveRecord::Base.transaction do
          pay_item
          @destination_buy.save
        end
        redirect_to root_path, notice: "購入が完了しました。"
      rescue
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render :index, status: :unprocessable_entity
      end
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_good
    @good = Good.find(params[:good_id])
  end
  
  def redirect_if_purchased
    if @good.buy?
      redirect_to root_path, alert: "この商品は既に購入済みです。"
    end
  end

  def redirect_if_seller
    if @good.user == current_user
      redirect_to root_path, alert: "自分の商品は購入できません。"
    end
  end

  def destination_buy_params
    params.require(:destinations_buy).permit(:post_code, :aria_id, :municipalities, :street, :building, :telephone).merge(user_id: current_user.id, good_id: params[:good_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @good.price,  # 商品の価格
      card: destination_buy_params[:token],  # フォームから送信されるトークン
      currency: 'jpy'
    )
 end
end
 

