class Word < ApplicationRecord
  belongs_to :category
  has_many :choices 
  accepts_nested_attributes_for :choices
end
