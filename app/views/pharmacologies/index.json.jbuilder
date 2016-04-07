json.array!(@pharmacologies) do |pharmacology|
  json.extract! pharmacology, :id
  json.url pharmacology_url(pharmacology, format: :json)
end
