json.array!(@cond_pharmas) do |cond_pharma|
  json.extract! cond_pharma, :id
  json.url cond_pharma_url(cond_pharma, format: :json)
end
