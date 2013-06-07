class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new #necessary for refilling forms?
    render :new
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      redirect_to bands_url
    else
      render :new
    end

  end

  def edit
    @band = Band.find(params[:band][:id])

    render :edit
  end

  def update
    @band = Band.find(params[:band][:id])
    @band.update_attributes(params[:band])
    if @band.save
      redirect_to @band
    else
      render :edit
    end
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy

    redirect_to bands_url
  end

end
