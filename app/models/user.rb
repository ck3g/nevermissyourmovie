class User < ActiveRecord::Base
  ROLES = [:admin]
  bitmask :roles, as: ROLES

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies, dependent: :nullify
  has_many :user_movies, dependent: :destroy
  has_many :watching_movies, through: :user_movies, class_name: "Movie",
    source: :movie

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      roles? role_name
    end
  end

  def watching?(movie)
    user_movies.where(movie_id: movie.id).exists?
  end
end
