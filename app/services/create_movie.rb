class CreateMovie
  attr_reader :movie

  def initialize(options = {})
    @movie = Movie.new options
  end

  def save
    save_result = @movie.save
    if save_result
      MovieInfoWorker.perform_async @movie.id
    end

    save_result
  end
end
