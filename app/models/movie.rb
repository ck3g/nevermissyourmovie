class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :user_movies, dependent: :destroy
  has_many :watchers, through: :user_movies, class_name: 'User',
    source: :movie

  validates :title, presence: true, uniqueness: true
end
