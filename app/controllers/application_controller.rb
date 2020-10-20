class ApplicationController < ActionController::Base
    before_action :require_login

  
    def require_login
        unless session.include? :user_id
            redirect_to login_path, notice: "You are not logged in!"
        end
    end
end
