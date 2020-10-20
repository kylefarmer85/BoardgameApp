class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy] 
    skip_before_action :require_login, only: [:new, :create]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.save 
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end


    def destroy
        @user.destroy
        redirect_to new_user_path, notice: "Employee Deleted!"
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
        
    def set_user
        @user = User.find(params[:id])
    end

end
