class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  validates :name, :price, :items_description, presence: true
  validates :category_id, :postage_id, :condition_id, :region_id, :number_of_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
