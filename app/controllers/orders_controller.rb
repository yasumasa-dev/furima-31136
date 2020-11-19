class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
  end
 
  def new
    @order_address = OrderAddress.new
  end
 
  def create
    @order_address = OrderAddress.new(address_params)
     if @order_address.valid?
       @order_address.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
  def address_params
   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building)
                                 .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
 
end
