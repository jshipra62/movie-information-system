class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.integer :movie_id
      t.integer :theater_id

      t.timestamps
    end
  end
end
