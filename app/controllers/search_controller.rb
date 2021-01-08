class SearchController < ApplicationController
  def index
    @poems = PoemFacade.fetch_poem_search_results(search_author)
    @author = params['author']

    conn = Faraday.new(url: "https://poetrydb.org")
    poem_response = conn.get("/author,poemcount/#{@author};10")
    @poems = JSON.parse(poem_response.body, symbolize_names: true)

    text = @poems[0][:lines].join(" ")

    conn = Faraday.new(url: "https://api.us-south.tone-analyzer.watson.cloud.ibm.com") do |f|
      f.basic_auth('apikey', ENV['IBM_API_KEY'])
    end
    ibm_response = conn.get("/instances/91cff91d-c782-4c4b-a0f8-fce6c9c0c6f0/v3/tone?version=2017-09-21&text=#{text}")
    @tones = JSON.parse(ibm_response.body, symbolize_names: true)
  end
end
