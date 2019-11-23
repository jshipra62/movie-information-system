json.extract! book, :id, :user_id, :theater_id, :movie_id, :show_id, :slot_id, :bdate, :bseat, :created_at, :updated_at
json.url book_url(book, format: :json)
