class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])

  end

  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
