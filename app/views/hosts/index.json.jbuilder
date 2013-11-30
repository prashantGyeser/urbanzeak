json.array!(@hosts) do |host|
  json.extract! host, :title, :about
  json.url host_url(host, format: :json)
end
