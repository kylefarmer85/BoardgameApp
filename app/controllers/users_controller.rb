class UsersController < ApplicationController

    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to :show
        else
            flash[:errors] = user.errors.full_messages
            render :new
        end
    end


    def show
    end

    def edit
    end

    def update

        redirect_to :show
    end


    def destroy

        redirect_to :new
    end

    private

        def user_params
        end

        

end
