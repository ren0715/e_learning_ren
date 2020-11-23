class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = Word.where(category_id: params[:category_id]).paginate(page: params[:page], per_page: 4)
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
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])

    if @word.update_attributes(word_params)
      flash[:success] = "Word and Choices updated!"
      redirect_to edit_admin_category_word_url
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    if @word.destroy
      flash[:info] = "Word deleted."
      redirect_to request.referrer
    end
  end

  before_action :admin

  private
    def admin
      if !current_user.is_admin?
        flash[:danger] = "You can't access admin pages."
        redirect_to user_dashboard_url(current_user)
      end
    end

    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
    end
end
