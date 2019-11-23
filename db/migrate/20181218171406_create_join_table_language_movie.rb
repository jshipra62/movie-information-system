class CreateJoinTableLanguageMovie < ActiveRecord::Migration[5.2]
  def change
    create_join_table :languages, :movies do |t|
      # t.index [:language_id, :movie_id]
      # t.index [:movie_id, :language_id]
    end
  end
end
