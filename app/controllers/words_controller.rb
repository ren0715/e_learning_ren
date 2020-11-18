class WordsController < ApplicationController
  def index
    @lessons = Lesson.all.where(user_id: current_user.id)
    # @answers = @lessons.answers
    # @categories = Category.all.where(id: @lessons.category_id)
    # @words = @categories.words
    
  end
end
