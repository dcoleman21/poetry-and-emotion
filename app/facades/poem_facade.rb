class PoemFacade
  def fetch_poem_search_results(search_author)
    PoemService.poem_by_author(search_author)
  end
end
