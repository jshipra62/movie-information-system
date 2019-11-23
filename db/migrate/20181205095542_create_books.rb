class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :theater_id
      t.integer :movie_id
      t.integer :show_id
      t.integer :slot_id
      t.date :bdate
      t.integer :bseat

      t.timestamps
    end
  end
end
