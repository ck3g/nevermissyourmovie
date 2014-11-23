class MoviesController < ApplicationController
  authorize_resource
  before_action :find_movie, only: [:show, :edit, :update, :destroy,
                                    :watch, :stop_watching, :approve,
                                    :reject]

  def index
    @movies = MoviesQuery.all
  end

  def show

  end

  def new
    @movie = current_user.movies.new
  end

  def create
    service = CreateMovie.new create_movie_params
    if service.save
      redirect_to movie_path(service.movie),
        notice: t(:created_successfully, entity: t('entity.movie'))
    else
      @movie = service.movie
      render :new
    end
  end

  def edit

  end

  def update
    if @movie.update_attributes movie_params
      redirect_to movie_path(@movie),
        notice: t(:updated_successfully, entity: t('entity.movie'))
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def watch
    ToWatchList.new(@movie, current_user).execute
    redirect_to watch_list_path,
      notice: t(:added_to_watch_list, title: @movie.title)
  end

  def stop_watching
    StopWatching.new(@movie, current_user).execute
    redirect_to watch_list_path,
      notice: t(:removed_from_watch_list, title: @movie.title)
  end

  def approval
    @movies = MoviesQuery.pending
  end

  def approve
    @movie.approve!
    redirect_to approval_movies_path,
      notice: t(:approved_successfully, title: @movie.title)
  end

  def reject
    @movie.reject!
    redirect_to approval_movies_path,
      notice: t(:rejected_successfully, title: @movie.title)
  end

  private
  def find_movie
    @movie = Movie.find params[:id]
  end

  def create_movie_params
    movie_params.merge({ user: current_user })
  end

  def movie_params
    params.require(:movie).permit(:title, :imdb_id)
  end
end
