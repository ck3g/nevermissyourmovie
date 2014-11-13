class CreateMovie
  def initialize(options = {})
    @options = options
  end

  def create
    Movie.create @options
  end
end
