json.extract! record, :id, :title, :artist_id, :year, :condition, :genre, :created_at, :updated_at
json.url record_url(record, format: :json)
