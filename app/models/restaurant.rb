class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  
  has_many :restaurant_pizzas
  has_many :pizzas, through: :restaurant_pizzas, dependent: :destroy
end
