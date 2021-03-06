class Admin::BaseController < ActionController::Base

  layout 'admin/layouts/admin'
  before_action :authenticate_user!
  before_action :require_is_admin

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

end
