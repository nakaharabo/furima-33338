require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,name,description,category,state,delivery_fee,shipment_area,shipment_day,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'discriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'categoryの値1が選択された場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'stateが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank"
      end
      it 'stateの値1が選択された場合は登録できない登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it 'delivery_feeが空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it 'delivery_feeの値1が選択された場合は登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it 'shipment_areaが空では登録できない' do
        @item.shipment_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment area can't be blank"
      end
      it 'shipment_areaの値1が選択された場合は登録できない' do
        @item.shipment_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment area must be other than 1"
      end
      it 'shipment_dayが空では登録できない' do
        @item.shipment_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment day can't be blank"
      end
      it 'shipment_dayの値1が選択された場合は登録できない' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment day must be other than 1"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceの価格範囲が300円~9999999円以外では登録できない' do
        @item.price= 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceの価格範囲が300円~9999999円以外では登録できない' do
        @item.price= 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が半角英数混合では登録できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が半角英語だけでは登録できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end