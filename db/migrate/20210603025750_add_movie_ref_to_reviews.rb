class AddMovieRefToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :movie, foreign_key: true
  end
end
