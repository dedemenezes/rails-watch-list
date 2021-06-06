class AddColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :genre, :string
    add_column :movies, :homepage, :string
    add_column :movies, :original_language, :string
    add_column :movies, :release_date, :string
    add_column :movies, :runtime, :integer
    add_column :movies, :imdb_id, :string
  end
end
