require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item, user: FactoryBot.create(:user))
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'すべての項目が埋まっていれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格が300円以上なら出品できる' do 
        @item.price = 300 
        expect(@item).to be_valid
      end
      it '価格が9,999,999以下なら出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'ユーザー登録していないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'items_descriptionが空では出品できない' do
        @item.items_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items description can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300円以上9,999,999円以下で入力してください")
      end
      it 'priceが9,999,999円以上では出品できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300円以上9,999,999円以下で入力してください")
      end
      it 'priceが半角数値以外では出品できない' do
        @item.price = '百'
        expect(@item).not_to be_valid
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'postage_idが空では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'region_idが空では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'number_of_day_idが空では出品できない' do
        @item.number_of_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of day can't be blank")
      end
    end
  end
end
