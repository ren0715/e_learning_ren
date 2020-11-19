class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  has_one :activity, as: :action, dependent: :destroy
  def correct_answers
    choices.where(is_correct: true).count
  end
  
  def next_word
    (category.words - words).first
  end

end
