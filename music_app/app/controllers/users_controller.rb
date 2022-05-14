class UsersController < ApplicationController
    # send user to sign up form
    def new
        user = User.new
        render :new
    end

    # save user who submitted signup form
    def create
        @user = User.new(user_params)

        if @user.save
            log_in_user(@user)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    # user login or if they go to their account page
    def show
        @user = User.find(params[:id])

        if @user
            render :show
        else
            redirect_to new_session_url
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
