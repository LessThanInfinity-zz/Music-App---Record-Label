class SessionsController < ApplicationController

  def new
    # this is where you log in.
    render :new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if user.verify_password(params[:user][:password])
      user.reset_session_token!
      session[:session_token] = user.session_token

      redirect_to bands_url
    else
      flash[:notices] ||= []
      flash[:notices] << "Username/password combo sucks."

      redirect_to new_session_url
      # redirect_to bands_url # incorrect. checnge
      #redirect to login page
    end
  end

  def destroy
    user = current_user

    if user.nil?
      redirect to new_session_url
      return
    end

    session[:session_token] = nil
    user.session_token = nil
    user.save!

    redirect to new_session_url
  end
end
