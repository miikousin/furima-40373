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
    end
  end
end
