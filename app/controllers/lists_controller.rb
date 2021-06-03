class ListsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]



  def index
    @lists = policy_scope(List).order(created_at: :desc)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)
    @review = Review.new
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    authorize @list
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo, :user)
  end
end
