class GoodsController < ApplicationController


  #before_action :set_good, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  
  
  def new
  @good = Good.new
  end
  
  
  def index
  @goods = Good.order(created_at: :desc)
  @goods_exist = @goods.any?
  end

  def show
    @good = Good.find(params[:id])
    @user = @good.user
  end
  
  
  def create
    @good = Good.new(good_params)
    @good.user = current_user
  
    if @good.save
      redirect_to root_path, notice: '商品が正常に出品されました！'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  
  #def update
  #if @good.update(good_params)
  #redirect_to @good, notice: 'Good was successfully updated.'
  #else
  #render :edit, status: :unprocessable_entity
  #end
  #end
  
  
  #def set_good
  #@good = Good.find(params[:id])
  #end
  
  
  private
  
  
  def good_params
    params.require(:good).permit(:name, :name_explanation, :category_id, :condition_id, :delivery_id, :aria_id, :shipment_id, :price, :image)
  end
  
  
  
  #def configure_permitted_parameters
  #devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #end
  
  
  end