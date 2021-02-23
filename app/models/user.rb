class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items 
  has_many :orders 

  
  validates_format_of :last_name_kana,  with: /\A[ァ-ヶー－]+\z/
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates_format_of :password,        with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/
  validates_format_of :last_name,       with: /\A[ぁ-んァ-ン一-龥]/
  validates_format_of :first_name,      with: /\A[ぁ-んァ-ン一-龥]/

  with_options presence: true do
    validates :password_confirmation
    validates :nickname
    validates :last_name
    validates :first_name 
    validates :last_name_kana
    validates :first_name_kana
    validates :birth
  end

end
