class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end
 
  def new
    @order_address = OrderAddress.new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
     if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path 
     else
       render action: :index
     end
  end
 
  private
  def address_params
   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building)
   .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
 
  def pay_item
  @item = Item.find(params[:item_id])
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(
    amount: @item.price, 
    card: address_params[:token],
    currency: 'jpy'
  )
  end
end
