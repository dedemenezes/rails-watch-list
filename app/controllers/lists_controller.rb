class ListsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lists = List.all
    @movies = Movie.all
    # policy_scope(List).order(created_at: :desc)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)
    @review = Review.new
    @movies = Movie.all
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    authorize @list
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo, :user)
  end
end
