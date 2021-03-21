class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :nickname, presence: true
         validates :email, uniqueness: true
         validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         validates :last_name, presence: true, format: {with: /\A[一-龥]+\z/ }
         validates :first_name, presence: true, format: {with: /\A[一-龥]+\z/ }
         validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
         validates :birth_day, presence: true


         has_many :items
         has_many :comments
         has_many :histories
end
