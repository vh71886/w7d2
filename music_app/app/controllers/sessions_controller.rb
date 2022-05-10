class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if @user
            log_in_user(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        @current_user.reset_session_token! if self.current_user
        session[:session_token] = nil
        @current_user = nil
    end
end
