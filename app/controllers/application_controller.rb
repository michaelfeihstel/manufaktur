class ApplicationController < ActionController::Base
  protect_from_forgery

  # include helpers
  helper :all
end
