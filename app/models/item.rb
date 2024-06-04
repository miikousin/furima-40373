class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュとのアソシエーション
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :number_of_day
  belongs_to :category
  
  #モデル間のアソシエーション
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, :items_description, :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "は300円以上9,999,999円以下で入力してください"}
  validates :category_id, :postage_id, :condition_id, :region_id, :number_of_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end

