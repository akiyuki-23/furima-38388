class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :category_id, :sales_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    return if @item.user == current_user

    redirect_to root_path
  end
end
