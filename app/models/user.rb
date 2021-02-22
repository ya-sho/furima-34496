class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items 
  has_many :orders   
  validates :password_confirmation,     presence: true
  validates :nickname,     presence: true
  validates :last_name,    presence: true
  validates :first_name,   presence: true
  validates :last_name_kana, presence: true
  validates_format_of :last_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates :birth, presence: true
  
  
  validates_format_of :password, with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/
end
