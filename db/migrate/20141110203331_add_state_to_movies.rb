class AddStateToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :state, :string, null: false, default: 'pending'
    add_index :movies, :state
  end
end
