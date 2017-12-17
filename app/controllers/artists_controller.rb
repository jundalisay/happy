class ArtistsController < ApplicationController

  before_action :logged_in_user, only: [:index, :show, :new, :edit, :update, :destroy]
  before_action :set_artist, only: [:show, :edit, :update, :destroy] 
  protect_from_forgery except: :show

  
  def index
    @artists = Artist.paginate(page: params[:page], per_page: 30)
    @liked_artists = Artist.top(5)
  end

  def show
  end

  private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:song).permit(:name, :photo)
    end
end