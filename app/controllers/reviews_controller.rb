class ReviewsController < ApplicationController
  before_action :set_movie



  def edit

  end
  def create
    @review =@movie.reviews.new(set_reviews)
    @review.user_id=current_user.id
    if @review.save
      redirect_to movie_url(@movie)
    end
  end

  def destroy
    @review=@movie.reviews.find(params[:id])
    if @review.destroy
      redirect_to movie_url(@movie)
    end
  end

  private
  def set_movie
    @movie=Movie.find(params[:movie_id])
  end

  def set_reviews
    params.require(:review).permit(:text, :movie_id, :user_id)
  end

end
