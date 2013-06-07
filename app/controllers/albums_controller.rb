class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show

    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def new
    @bands = Band.all
    @album = Album.new #necessary for refilling forms?
    render :new
  end

  def create
    @bands = Band.all
    @album = Album.new(params[:album])
    if @album.save
      redirect_to Band.find(@album.band_id)
    else
      render :new
    end

  end

  def edit
    @album = Album.find(params[:album][:id])

    render :edit
  end

  def update
    @album = Album.find(params[:album][:id])
    @album.update_attributes(params[:album])
    if @album.save
      redirect_to @album
    else
      render :edit
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy

    redirect_to albums_url
  end


end
