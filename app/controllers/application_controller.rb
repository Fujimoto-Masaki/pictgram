class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  include CommonActions
  helper_method :current_user, :logged_in?


end
