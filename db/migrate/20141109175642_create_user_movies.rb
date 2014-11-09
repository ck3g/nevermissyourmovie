class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.references :user, index: true, null: false
      t.references :movie, index: true, null: false

      t.timestamps
    end
  end
end
