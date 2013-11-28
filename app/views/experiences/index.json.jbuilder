json.array!(@experiences) do |experience|
  json.extract! experience, :name, :description, :price, :exp_date, :exp_time, :latitude, :longitude
  json.url experience_url(experience, format: :json)
end
