class ReviewsController < ApplicationController

  include ActionView::Helpers::DateHelper

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
    authorize @review
  end

  def create
    @list = List.find(params[:list_id])
    @bookmarks = Bookmark.all
    @review = Review.new(review_params)
    authorize @review
    @review.list = @list
    @review.user = current_user
    if @review.save
      redirect_to list_path(@list, anchor: "review-#{@review.id}")
    else
      flash[:alert] = "Something went wrong."
      render 'lists/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy

    redirect_to list_path(@review.list, anchor: "review-#{@review.id - 1}")
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :movie_id, :list, :user)
    
  end
end
