class MoviesQuery
  def initialize(relation = Movie)
    @relation = relation
  end

  def self.all
    new.all
  end

  def self.pending
    new(Movie.pending).all
  end

  def all
    @relation.all
  end
end
