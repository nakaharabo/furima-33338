class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :nickname, presence: true
         validates :email, uniqueness: true
         validates :encrypted_password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
         validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :last_name_kana, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :birth_day, presence: true


         has_many :items
         has_many :comments
         has_many :histories
end
