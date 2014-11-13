class Movie < ActiveRecord::Base
  include AASM

  belongs_to :user
  has_many :user_movies, dependent: :destroy
  has_many :watchers, through: :user_movies, class_name: 'User',
    source: :user

  validates :title, presence: true, uniqueness: true

  aasm column: :state do
    state :pending, initial: true
    state :approved
    state :rejected

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end
end
