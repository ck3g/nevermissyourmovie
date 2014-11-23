class MovieInfoWorker
  include Sidekiq::Worker

  def perform(movie_id)

  end
end
