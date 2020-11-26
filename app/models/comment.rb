class Comment < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :replies

  validates :content, presence: true, length: { maximum: 50 }
end
