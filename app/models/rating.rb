class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  after_save :update_ratings
  after_update :update_ratings

  validates :movie_id, uniqueness: { scope: :user_id, message: 'You can only rate a movie once.' }

  def update_ratings
    movie.update(ratings_average: movie.ratings.average(:star).round(1))
  end
end
