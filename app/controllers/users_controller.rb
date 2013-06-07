class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new #necessary for refilling forms?
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver!
      redirect_to bands_url
    else
      render :new
    end

  end

  def edit
    @user = User.find(params[:user][:id])

    render :edit
  end

  def update
    @user = User.find(params[:user][:id])
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_url
  end
end
