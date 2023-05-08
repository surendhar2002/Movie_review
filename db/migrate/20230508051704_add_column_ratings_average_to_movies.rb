class AddColumnRatingsAverageToMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies,:ratings_average
    add_column :movies, :ratings_average, :float , default: 0
  end
end
