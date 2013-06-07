class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    render :show
  end

  def new
    @albums = Album.all
    @track = Track.new #necessary for refilling forms?
    render :new
  end

  def create
    @albums = Album.all
    @track = Track.new(params[:track])
    if @track.save
      redirect_to Album.find(@track.album_id)
    else
      render :new
    end

  end

  def edit
    @track = Track.find(params[:track][:id])

    render :edit
  end

  def update
    @track = Track.find(params[:track][:id])
    @track.update_attributes(params[:track])
    if @track.save
      redirect_to @track
    else
      render :edit
    end
  end

  def destroy
    album = Track.find(params[:id])
    album.destroy

    redirect_to albums_url
  end
end
