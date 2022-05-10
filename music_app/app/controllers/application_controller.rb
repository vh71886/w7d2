class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session: session[:session_token])
    end

    def logged_in?
        current_user ? true : false
    end

    def log_in_user(user)
        session[:session_token] = user.reset_session_token!
    end

    
end