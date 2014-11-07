class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  # include helpers
  helper :all

  # filter
  before_filter :store_history

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def store_history
    session[:history] ||= []
    session[:history].delete_at(0) if session[:history].size >= 5
    session[:history] << request.url
  end

  def user_not_authorized
    flash[:error] = "Sie müssen angemeldet sein um diese Aktion durchzuführen."
    redirect_to(request.referrer || new_user_session_path)
  end

end