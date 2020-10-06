class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :describe, presence: true
  validates :price, presence: true
end
