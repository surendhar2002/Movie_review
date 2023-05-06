class RatingsController < ApplicationController
  before_action :set_movie

  def create
    @rating = @movie.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to movie_url(@movie)
    end
  end

  private
  def set_rating
    @rating = Rating.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

    def rating_params
      params.require(:rating).permit(:user_id, :movie_id, :star)
    end
end
