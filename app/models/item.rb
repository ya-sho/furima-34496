class Item < ApplicationRecord
  belongs_to :user
  # has_many :comments
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :days

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :area_id
    validates :days_id
  end

  validates :price,
            numericality: {
              greater_than_or_equal_to: 300,
              less_than: 10_000_000
            }

  validates_format_of :price, with: /\A-?[0-9]+(\.[0-9]+)?\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end
end
