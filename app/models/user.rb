class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true      
         validates :first_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナで入力して下さい。" }
         validates :last_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナで入力して下さい。" }
         validates :birth_day, presence: true
end
