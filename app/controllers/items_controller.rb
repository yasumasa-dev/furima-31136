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

  def show
    @item = Item.includes(:user).find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
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