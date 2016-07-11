json.array!(@wordcards) do |wordcard|
  json.extract! wordcard, :id
  json.url wordcard_url(wordcard, format: :json)
end
