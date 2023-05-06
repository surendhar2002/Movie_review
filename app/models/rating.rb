class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  after_save :update_ratings


  def update_ratings
    movie.update(ratings_average: movie.ratings.average(:star).round(1))
  end
end
