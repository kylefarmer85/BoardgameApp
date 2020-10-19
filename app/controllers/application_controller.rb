class ApplicationController < ActionController::Base

    def current_user
        session[:name] = nil
        end

end
