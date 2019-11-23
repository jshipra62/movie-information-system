class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.string :language
      t.string :rating
      t.date :rdate

      t.timestamps
    end
  end
end
