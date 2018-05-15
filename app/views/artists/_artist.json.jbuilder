json.extract! artist, :id, :name, :band_type, :created_at, :updated_at
json.url artist_url(artist, format: :json)
