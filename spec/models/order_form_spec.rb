require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    before do 
      @order_form = FactoryBot.build(:order_form)
    end

    context '商品購入できないとき' do
      it 'post_codeが空ではできない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが全角では購入できない' do
        @order_form.post_code = '１１１－１１１１'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code はハイフンあり7桁で入力して下さい")
      end

      it 'post_codeがハイフンなしでは購入できない' do
        @order_form.post_code = '1111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code はハイフンあり7桁で入力して下さい")
      end

      it 'region_idが空ではできない' do
        @order_form.region_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region を選択してください")
      end

      it 'cityが空ではできない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空ではできない' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end

      it 'telが空ではできない' do
        @order_form.tel = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが9桁以下では購入できない' do
        @order_form.tel = '12345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end

      it 'telが12桁以上では購入できない' do
        @order_form.tel = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end

      it 'telがハイフンがあると購入できない' do
        @order_form.tel = '123-4567-8901'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end

      it 'telが全角数値では購入できない' do
        @order_form.tel = '１１１－１１１１－１１１１'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel はハイフンなし10桁か11桁で入力して下さい")
      end
    end
  end
end
