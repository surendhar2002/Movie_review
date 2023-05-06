class ResetAllMovieCacheCounters < ActiveRecord::Migration[6.1]
  def up

    Movie.all.each do |movie|

      Movie.reset_counters(movie.id, :reviews)

    end

  end

  def down

    # no rollback needed

  end
end
