class Word < ApplicationRecord
  belongs_to :category
  has_many :choices 
  accepts_nested_attributes_for :choices

  validate :only_one_is_checked

  validates :content,presence: true, length: { maximum: 50 }
  private

  # validates choices: :content,uniqueness: { case_sensitive: false}
    def only_one_is_checked
      if choices.select{ |choice| choice.is_correct == "true" }.count !=1
        return errors.add :base, "Must have one correct choice"
      end
    end
end
