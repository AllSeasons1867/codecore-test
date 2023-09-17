class ApplicationController < ActionController::Base
    private 
    def authenticate_user! 
        unless current_user.present? 
            flash[:danger] = "You must sign in or sign up first!"
            redirect_to new_session_path
        end
    end

    def current_user 
        if session[:user_id].present?
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end 
    helper_method(:current_user)
end

