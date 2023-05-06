class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name, length: { in: 1..50 },presence: true
  validates :re_date, presence: true

  scope :filter_by_date, ->(star_date,end_date){where(re_date: star_date..end_date)}

  default_scope { order(ratings_average: :desc) }
end
