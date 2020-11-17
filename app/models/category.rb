class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  has_many :lessons, dependent: :destroy
end
