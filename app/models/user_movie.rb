class UserMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, presence: true
  validates :movie_id, uniqueness: { scope: :user_id }
end
