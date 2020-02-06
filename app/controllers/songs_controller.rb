class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    set_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      #hold on to @song, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :new
    end
  end
  
  def edit
    set_song
  end

  def update
    set_song
    @song.attributes = song_params

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    set_song.destroy    
    redirect_to songs_path
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end
  
  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
