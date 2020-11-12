class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save 
      redirect_to root_path 
    else
      render :new 
    end
  end

  private
  def items_params
    params.require(:item).permit(:title,
                                 :image, 
                                 :price,
                                 :explanation,
                                 :category_id, 
                                 :condition_id, 
                                 :delivery_fee_id, 
                                 :shipment_source_id, 
                                 :shipment_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
    redirect_to action: ：index
    end
  end
end