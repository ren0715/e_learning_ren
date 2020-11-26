class PagesController < ApplicationController
  skip_before_action :login,raise: false
  def home
  end
end
