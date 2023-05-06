class Review < ApplicationRecord
  belongs_to :movie , counter_cache: :reviews_count
  belongs_to :user
end
