class UpdateMovieInfo
  attr_reader :movie

  def initialize(movie)
    @movie = movie
  end

  def execute
    @movie.update_attributes info
  end

  private
  def info
    @info ||= strategy.info.to_h
  end

  def strategy
    @strategy ||= UpdateMovie::RottenTomatoesStrategy.new(strategy_attrs)
  end

  def strategy_attrs
    if movie.imdb_id.present?
      { imdb: movie.imdb_id }
    else
      { title: movie.title }
    end
  end
end
