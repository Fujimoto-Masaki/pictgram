module CommonActions
  extend ActiveSupport::Concern

  included do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !current_user.nil?
    end
  end

end
