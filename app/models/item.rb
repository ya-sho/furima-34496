class Item < ApplicationRecord
  belongs_to :user 
  has_many :comments 
  has_one :order 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status 
  belongs_to :cost
  belongs_to :area
  belongs_to :days
  

  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id,   numericality: { other_than: 1 }
  validates :cost_id,     numericality: { other_than: 1 }
  validates :area_id,     numericality: { other_than: 1 }
  validates :days_id,     numericality: { other_than: 1 }

  validates :price,
    numericality: {
      greater_than_or_equal_to: 300,
      less_than: 9999999,
    }

  validates_format_of :price,  with: /\A[-]?[0-9]+(\.[0-9]+)?\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation

  end


end

