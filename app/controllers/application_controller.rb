class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :login
  
  private
  def login
    if !current_user
      flash[:danger] = "You must be logged in to access this section."
      redirect_to login_url
    end
  end
end
