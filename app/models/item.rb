class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  with_options presence:true do
    validates :item_name
    validates :item_info
    validates :item_price, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9,999,999, 'is invalid' }
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :item_scheduled_delivery_id
  end
end
