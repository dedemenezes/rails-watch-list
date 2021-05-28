class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
