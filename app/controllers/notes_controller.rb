class NotesController < ApplicationController

  def index
    @notes = Note.all
    render :index
  end

  def show
    @note = Note.find(params[:id])
    @track = Track.find(@note.track_id)
    render :show
  end

  def new
    @tracks = Track.all
    @note = Note.new #necessary for refilling forms?
    render :new
  end

  def create
    @tracks = Track.all
    @note = Note.new(params[:note])
    if @note.save
      redirect_to Track.find(@note.track_id)
    else
      render :new
    end

  end

  def edit
    @note = Note.find(params[:note][:id])

    render :edit
  end

  def update
    @note = Note.find(params[:note][:id])
    @note.update_attributes(params[:note])
    if @note.save
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy

    redirect_to track_url # refer back.
  end
end
