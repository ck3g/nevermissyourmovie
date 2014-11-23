class CreateMovie
  attr_reader :movie

  def initialize(options = {})
    @movie = Movie.new options
  end

  def save
    @movie.save
  end
end
