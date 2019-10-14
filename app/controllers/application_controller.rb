class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protected
  def require_admin
    redirect_to root_path if current_user.admin?
  end
end