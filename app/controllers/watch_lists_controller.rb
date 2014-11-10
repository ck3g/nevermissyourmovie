class WatchListsController < ApplicationController
  authorize_resource class: false

  def show
    @movies = WatchList.for(current_user)
  end
end
