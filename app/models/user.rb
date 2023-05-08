class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true


  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  private
  def welcome_email
    UserJob.perform_later(self)
  end
end
