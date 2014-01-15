json.array!(@advance_bookings) do |advance_booking|
  json.extract! advance_booking, :name, :email, :booking_date
  json.url advance_booking_url(advance_booking, format: :json)
end
