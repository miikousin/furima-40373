require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'すべての項目があれば購入できる' do
        expect(@order_form).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
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
        @order_form.region_id = 1
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

      it 'user_idが空では購入できない' do 
        @order_form.user_id = ""  
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @order_form.item_id = ""  
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
