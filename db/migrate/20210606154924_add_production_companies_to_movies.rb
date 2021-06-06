class AddProductionCompaniesToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :production_companies, :string
  end
end
