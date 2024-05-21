require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'name、price、items_description、category_id、postage_id、condition_id、region_id、number_of_day_idがあれば登録できる' do
        expect(@item).to be_valid
      end
    context '商品出品ができないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        binding.pry
        expect(@user.errors.full_messages).to include
      end
      it 'items_descriptionが空では出品できない' do
        @item.items_description = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'imageが空では出品できない' do
        @item.image = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'postage_idが空では出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'region_idが空では出品できない' do
        @item.region_id = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'number_of_day_idが空では出品できない' do
        @item.number_of_day_id = ''
        @item.valid?
        expect(@user.errors.full_messages).to include
      end
    end
    end
  end
end
