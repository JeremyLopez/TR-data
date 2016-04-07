json.array!(@patents) do |patent|
  json.extract! patent, :id
  json.url patent_url(patent, format: :json)
end
