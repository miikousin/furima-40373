class OrderForm
  include ActiveModel::Model
  #orderテーブル、purchasesテーブルのカラムを書く
  attr_accessor :post_code, :region_id, :city, :house_number, :building_name, :tel, :item_id, :user_id, :token
  #purchase_idはorderが保存されてから生成されるので不要

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンあり7桁で入力して下さい" }
    validates :region_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "はハイフンなし10桁か11桁で入力して下さい" }
    validates :item_id
    validates :user_id
    validates :token
    
  end
    
  def save  #attr_accessorの値をそれぞれのテーブルに分ける
    
    #購入履歴を保存。orderでpurchase_idを使うので代入しておく。
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    #配送先情報を保存
    Order.create(post_code: post_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, tel: tel, purchase_id: purchase.id)
    
  end
end