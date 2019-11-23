json.extract! movie, :id, :title, :synopsis, :language, :rating, :rdate, :created_at, :updated_at
json.url movie_url(movie, format: :json)
