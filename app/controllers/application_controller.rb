class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    session_token = session[:session_token]
    return nil if session_token.nil?

    User.find_by_session_token(session_token)
    return
  end
end
