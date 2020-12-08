class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def show
        render :show
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login_user!(user)
            redirect_to user_url
        else
            flash.now[:error] = @user.errors.full_messages
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end