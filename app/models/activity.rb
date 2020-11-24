class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :action, polymorphic: true
  default_scope { order(created_at: :desc) }
  has_many :votes
end
