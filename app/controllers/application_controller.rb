class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
      if session[:user_id]
        @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
      else
        @current_user = nil
      end
    end
  end