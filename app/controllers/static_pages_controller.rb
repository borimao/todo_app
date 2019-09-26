class StaticPagesController < ApplicationController
  before_action :login_check
  def home
    
  end
  
  private
    def login_check
      if logged_in?
        redirect_to tasks_path
      end 
    end 
end
