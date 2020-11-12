class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)

    if @word.save
      flash[:success] = "Word and Choices created!"
      redirect_to admin_category_words_url
    else
      render 'new' 
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
  end

  def destroy
  end
  private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:content, :is_correct])
    end
end
