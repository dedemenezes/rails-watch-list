class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new( bookmark_params )
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie
    @bookmark.list = @list
    authorize @bookmark
    if @bookmark.save
      redirect_to list_path(@list, anchor: "bookmark-#{@bookmark.id}")
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy

    redirect_to list_path(@bookmark.list, anchor: "bookmarks")
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie, :comment)
  end
end
