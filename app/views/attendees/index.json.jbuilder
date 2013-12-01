json.array!(@attendees) do |attendee|
  json.extract! attendee, :seats, :user_id, :experience_id
  json.url attendee_url(attendee, format: :json)
end
