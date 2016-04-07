json.array!(@drugs) do |drug|
  json.extract! drug, :id
  json.url drug_url(drug, format: :json)
end
