class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :number_of_day
  belongs_to :category
  
  belongs_to :user
  has_one_attached :image

  validates :name, :items_description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :postage_id, :condition_id, :region_id, :number_of_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
