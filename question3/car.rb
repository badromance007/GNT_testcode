class Car < ApplicationRecord
  validates :maker, presence: true, length: { minimum: 2 }
  validates :model, presence: true, length: { minimum: 2 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1900 }
  validates :color, presence: true
  validates :price, presence: true, numericality: true
end