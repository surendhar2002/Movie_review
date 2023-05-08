class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :set_review ,only: %i[edit update]
  def edit

  end
  def create
    @review =@movie.reviews.new(reviews_params)
    @review.user_id=current_user.id
    if @review.save
      redirect_to movie_url(@movie),notice: "Comment was successfully created."
    end
  end

  def update
    if @review.update(reviews_params)
      redirect_to movie_url(@movie),notice: "Comment was successfully updated"
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
  def set_review
    @review=Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:text, :movie_id, :user_id)
  end

end
