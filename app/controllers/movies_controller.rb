class MoviesController < ApplicationController
  authorize_resource
  before_action :find_movie, only: [:destroy]

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

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def find_movie
    @movie = Movie.find params[:id]
  end

  def movie_params
    params.require(:movie).permit(:title, :tv_show)
  end
end
