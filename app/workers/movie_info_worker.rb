class MovieInfoWorker
  include Sidekiq::Worker

  def perform(movie_id)
    movie = Movie.find movie_id
    UpdateMovieInfo.new(movie).execute
  end
end
