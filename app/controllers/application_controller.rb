class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  # include helpers
  helper :all

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "Sie müssen angemeldet sein um diese Aktion durchzuführen."
    redirect_to(request.referrer || new_user_session_path)
  end

end