class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :birthday
       
          with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true, message:"Full-width characters"} do
            validates :first_name_character
            validates :last_name_character
          end
       
          with_options format: {with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: "Full-width katakana characters"} do
            validates :first_name_kana
            validates :last_name_kana
          end
        end
         validates :password,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ ,message: " Include both letters and numbers"}

end

