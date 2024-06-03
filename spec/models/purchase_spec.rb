require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入機能' do 
    before do 
      @purchase = FactoryBot.build(:purchase)
    end

    context '商品購入できるとき' do
      it 'user_idとitem_idが存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'user_idが空では購入できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
