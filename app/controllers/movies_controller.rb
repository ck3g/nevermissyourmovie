class MoviesController < ApplicationController
  authorize_resource

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      redirect_to movies_path,
        notice: t(:created_successfully, entity: t('entity.movie'))
    else
      render :new
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :tv_show)
  end
end
