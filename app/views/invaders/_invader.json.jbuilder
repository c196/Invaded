json.extract! invader, :id, :name, :description, :hints, :location, :users_id, :accuracy, :credibility, :created_at, :updated_at
json.url invader_url(invader, format: :json)