class MoviesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @list = List.new
    if params[:query].present?
      @movies = Movie.search_by_title_and_overview(params[:query])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.new
    @lists = List.where(user: current_user)
    authorize @movie
  end

end

# Search join table
# OR directors.first_name @@ :query \
# OR directors.last_name @@ :query \
