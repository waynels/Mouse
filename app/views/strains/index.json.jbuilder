json.array!(@strains) do |strain|
  json.extract! strain, :id
  json.url strain_url(strain, format: :json)
end
