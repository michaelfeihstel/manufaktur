class ApplicationController < ActionController::Base
  protect_from_forgery

  # include helpers
  helper :all

  before_filter :store_history

  private

    def store_history
      session[:history] ||= []
      session[:history].delete_at(0) if session[:history].size >= 5
      session[:history] << request.url
    end

end