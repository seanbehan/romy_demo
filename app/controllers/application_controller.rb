class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_current_user

  def require_current_user
    unless current_user
      flash[:notice] = "Please login to continue"
      redirect_to join_path
    end
  end
end
