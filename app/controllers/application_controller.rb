class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :check_rack_mini_profiler

  # include helpers
  helper :all

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "Sie müssen angemeldet sein um diese Aktion durchzuführen."
    redirect_to(request.referrer || new_user_session_path)
  end

  def check_rack_mini_profiler
    # for example - if current_user.admin?
    if params[:rmp]
      Rack::MiniProfiler.authorize_request
    end
  end
end
