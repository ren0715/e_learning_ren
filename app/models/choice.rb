class Choice < ApplicationRecord
  belongs_to :word

  # validates :is_correct, presence: true
end
