class Food < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :recipes

  validates :name, presence: true
  validates :measurement_unit, presence: true, format: { with: /[a-zA-Z]/ }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :available_quantity, presence: true, numericality: { greater_or_equal_to: 0 }
end
