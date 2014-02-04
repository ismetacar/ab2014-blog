json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn, :author, :description
  json.url book_url(book, format: :json)
end
