class StopWatching
  attr_reader :movie, :user

  def initialize(movie, user)
    @movie = movie
    @user = user
  end

  def execute
    user_movie.try(:destroy)
  end

  private
  def user_movie
    UserMovie.where(user_id: user.id, movie_id: movie.id).first
  end
end
