json.array!(@genes) do |gene|
  json.extract! gene, :id
  json.url gene_url(gene, format: :json)
end
