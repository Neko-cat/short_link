class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :log_out

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?    
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
     end
end
