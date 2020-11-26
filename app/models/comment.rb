class Comment < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_one :reply

  validates :content, presence: true, length: { maximum: 50 }
end
