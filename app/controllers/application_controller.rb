class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user, :logged_in?

    def current_user
        User.find_by(id: session[:user_id])  
    end
  
    def logged_in?
        current_user.id? != nil
    end

    def require_login
        unless session.include? :user_id
            redirect_to login_path, notice: "You are not logged in!"
        end
    end
end
