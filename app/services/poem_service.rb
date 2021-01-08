class PoemService
  def poem_by_author(search_author)
    author = search_author

    conn = Faraday.new(url: "https://poetrydb.org")
    response = conn.get("/author,poemcount/#{author};10")

    poems = JSON.parse(response.body, symbolize_names: true)
  end
end
