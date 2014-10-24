class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.boolean :tv_show, default: true

      t.timestamps
    end
  end
end
