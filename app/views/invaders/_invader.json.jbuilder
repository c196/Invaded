json.extract! invader, :id, :name, :description, :hints, :location, :users_id, :image, :created_at, :updated_at
json.url invader_url(invader, format: :json)