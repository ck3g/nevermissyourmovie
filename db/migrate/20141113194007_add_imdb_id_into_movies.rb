class AddImdbIdIntoMovies < ActiveRecord::Migration
  def change
    add_column :movies, :imdb_id, :string
    add_index :movies, :imdb_id
  end
end
