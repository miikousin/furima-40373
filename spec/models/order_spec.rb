require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do 
      @order = FactoryBot.build(:order)
    end


    context '商品購入できないとき' do
      it 'post_codeが空ではできない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが全角では購入できない' do
        @order.post_code = '１１１－１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code はハイフンあり7桁で入力して下さい")
      end

      it 'post_codeがハイフンなしでは購入できない' do
        @order.post_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code はハイフンあり7桁で入力して下さい")
      end

      it 'region_idが空ではできない' do
        @order.region_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Region を選択してください")
      end

      it 'cityが空ではできない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空ではできない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it 'telが空ではできない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが9桁以下では購入できない' do
        @order.tel = '12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end

      it 'telが12桁以上では購入できない' do
        @order.tel = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end

      it 'telがハイフンがあると購入できない' do
        @order.tel = '123-4567-8901'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end

      it 'telが全角数値では購入できない' do
        @order.tel = '１１１－１１１１－１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end
    end
  end
end
