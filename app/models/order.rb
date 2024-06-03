class Order < ApplicationRecord
  belongs_to :purchase
  belongs_to :user
  belongs_to :item

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンあり7桁で入力して下さい" }
    validates :region_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city, presence: true
    validates :house_number, presence: true
    validates :tel, presence: true, format: { with: /\A\d{10,11}\z/, message: "はハイフンなし10桁か11桁で入力して下さい" }
end

