class WatchListsController < ApplicationController
  authorize_resource class: false

  def show
    @movies = current_user.watching_movies
  end
end
