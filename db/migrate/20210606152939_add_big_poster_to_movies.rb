class AddBigPosterToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :big_poster, :string
  end
end
