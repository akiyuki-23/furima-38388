class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
  end

end
