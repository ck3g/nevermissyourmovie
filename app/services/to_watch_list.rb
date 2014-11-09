class ToWatchList
  attr_reader :movie, :user

  def initialize(movie, user)
    @movie = movie
    @user = user
  end

  def execute
    UserMovie.create movie: movie, user: user
  end
end
