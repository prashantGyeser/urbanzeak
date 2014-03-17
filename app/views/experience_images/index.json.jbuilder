json.array!(@experience_images) do |experience_image|
  json.extract! experience_image, :image, :experience_id, :type
  json.url experience_image_url(experience_image, format: :json)
end
