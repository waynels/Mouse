json.array!(@mice) do |mouse|
  json.extract! mouse, :id
  json.url mouse_url(mouse, format: :json)
end
