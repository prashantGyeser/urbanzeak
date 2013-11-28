json.array!(@experiences) do |experience|
  json.extract! experience, :name, :description, :exp_date, :exp_time, :price, :latitude, :longitude, :max_seats
  json.url experience_url(experience, format: :json)
end
