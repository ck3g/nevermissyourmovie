class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies, dependent: :nullify
  has_many :user_movies, dependent: :destroy
  has_many :watching_movies, through: :user_movies, class_name: "Movie",
    source: :user
end
