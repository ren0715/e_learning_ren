class Reply < ApplicationRecord
  belongs_to :comment

  validates :content, presence: true, length: { maximum: 50 }
end
