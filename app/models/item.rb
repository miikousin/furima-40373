class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :number_of_day
  belongs_to :category
  
  belongs_to :user
  has_one_attached :image
end
