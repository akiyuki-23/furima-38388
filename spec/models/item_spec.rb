require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '出品ができる場合' do
      it 'すべての情報が正しく入力できれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      # image
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      # 商品名と商品説明
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      # 商品の詳細
      it 'category_idがid:1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_status_idがid:1では登録できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      # 配送について
      it 'shipping_fee_status_idがid:1では登録できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefecture_idがid:1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'item_scheduled_delivery_idがid:1では登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      # 販売価格
      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが300未満では登録できない' do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it 'item_priceが10000000以上では登録できない' do
        @item.item_price = '100000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it 'item_priceが半角英字では登録できない' do
        @item.item_price = 'item'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'item_priceが全角数字では登録できない' do
        @item.item_price = '７０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'item_priceが半角英数混合では登録できない' do
        @item.item_price = 'test300'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      # user
      it 'userがが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
