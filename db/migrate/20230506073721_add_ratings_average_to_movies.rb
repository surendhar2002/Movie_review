class AddRatingsAverageToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :ratings_average, :float
  end
end
