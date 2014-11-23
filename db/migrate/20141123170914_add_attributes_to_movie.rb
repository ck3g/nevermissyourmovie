class AddAttributesToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :plot, :text
    add_column :movies, :movie_type, :string
    add_column :movies, :poster, :string
  end
end
