class SongsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /songs
  def index
    songs = Song.all 
    render json: songs, status: :ok
  end

  # GET /songs/:id
  def show
    song = Song.find(params[:id])
    render json: song, serializer: SongReviewSerializer, status: :ok
  end

  def top_charts
    top_song = Song.most_popular
    render json: top_song.json_obj
  end

  private

  # def not_found(exception)
  #   render json: { errors: exception.message }, status: :not_found
  # end

  def not_found(error)
    render json: {errors: "#{error.model} Not Found"}, status: :not_found
  end


end
