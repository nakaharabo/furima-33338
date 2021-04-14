require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
    before do
      @order_history = FactoryBot.build(:order_history)
    end
    describe '商品購入機能' do
      context '商品購入できるとき' do
        it 'post_number,shipment_area,city,address,building_name,phone_number,tokenが存在すれば登録できる' do
          expect(@order_history).to be_valid
        end
        it 'buildingが存在しなくても登録できる' do
          @order_history.building_name = ''
          expect(@order_history).to be_valid
        end
        
      end
      context '商品購入できないとき' do
        it 'post_numberが空では登録できない' do
          @order_history.post_number = ''
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Post number can't be blank"
        end
        it 'post_numberにハイフンがない場合は登録できない' do
          @order_history.post_number = '2223333'
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Post number is invalid"
        end
        it 'post_numberが7桁の数字でない場合は登録できない' do
          @order_history.post_number = '222333'
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Post number is invalid"
        end
        it 'post_numberが数字でない場合は登録できない' do
          @order_history.post_number = 'aaa-aaaa'
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Post number is invalid"
        end
        it 'shipment_areaが空では登録できない' do
          @order_history.shipment_area_id = ''
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Shipment area can't be blank"
        end
        it 'shipment_areaの値1が選択された場合は登録できない' do
          @order_history.shipment_area_id = 1
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Shipment area must be other than 1"
        end
        it 'cityが空では登録できない' do
          @order_history.city = ''
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "City can't be blank"
        end
        it 'addressが空では登録できない' do
          @order_history.address = ''
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Address can't be blank"
        end
        it 'phone_numberが空では登録できない' do
          @order_history.phone_number = ''
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Phone number can't be blank"
        end
        it 'phone_numberは11桁以内でなければ登録できない' do
          @order_history.phone_number = "080111122222"
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Phone number is invalid"
        end
        it 'phone_numberにハイフンがあると登録できない' do
          @order_history.phone_number = "080-1111-2222"
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include "Phone number is invalid"
        end
        it "tokenが空では登録できないこと" do
          @order_history.token = nil
          @order_history.valid?
          expect(@order_history.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end

