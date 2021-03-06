class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_boardgame_path(current_user)
        else
            flash[:error] = "Username / Password combination not found"
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path
    end
    
end
