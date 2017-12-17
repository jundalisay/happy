class SongsController < ApplicationController

  before_action :logged_in_user, only: [:show, :needed_products, :new, :edit, :update, :destroy, :play]
  before_action :set_song, only: [:show, :edit, :update, :destroy, :play, :stop] 
  protect_from_forgery except: :show

  
  def index
    @genres = Genre.all

    if params[:q]
      @songs = Song.search(params[:q])
      if params[:q].blank?
        @songs = Song.paginate(page: params[:page], per_page: 30)
      else
      end
    else
      @songs = Song.all.paginate(page: params[:page], per_page: 30)
    end

  end
  

  def show
    @first = Listening.where("user_id = ? AND song_id = ?", current_user.id, @song.id).first
    @last = Listening.where("user_id = ? AND song_id = ?", current_user.id, @song.id).last
    @listenings = Listening.where("user_id = ? AND song_id = ?", current_user.id, @song.id)
    @this_listenings = Listening.where("song_id = ?", @song.id)
    # @total_diff = TimeDifference.between(@last.end, @first.created_at).in_seconds
    # @inject = @listenings.inject(2, :+)
    # @total_diff = @listenings.map {|s| s['']}.reduce(0, :+)
  end


  def play    
    @listenings = Listening.where("user_id = ? AND song_id = ?", current_user.id, @song.id)
    Listening.create(user_id: current_user.id, song_id: @song.id)
    current_user.like(@song)
  end


  def stop
    @listening = Listening.where("user_id = ?", current_user.id).last
    @listening.update_attributes(end: Time.now)
    @diff = TimeDifference.between(@listening.end, @listening.created_at).in_minutes
    @listenings = Listening.where("user_id = ? AND song_id = ?", current_user.id, @song.id)    
    # current_user.like(@song)
  end


  private

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(
        :genre_id, :song_id, :title, :artist,
        :album,
        :link)
    end
end