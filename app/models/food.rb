class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true, format: { with: /[a-zA-Z]/ }
  validates :price, presence: true, numericality: { only_integer: true }
end
