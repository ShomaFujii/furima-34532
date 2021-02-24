class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
         validates :nickname, presence: true
         validates :first_name_character, presence: true,
         format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true, message:"Full-width characters" }
         validates :last_name_character, presence: true,
         format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true, message:"Full-width characters"}
         validates :first_name_kana, presence: true,
         format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: "Full-width katakana characters" }
         validates :last_name_kana, presence: true,
         format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message:"Full-width katakana characters" }
         validates :birthday, presence: true

         validates :password,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ ,message: " Include both letters and numbers"}

end

