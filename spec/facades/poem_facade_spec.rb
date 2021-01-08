require 'rails_helper'

describe 'Poem Facade'do
  it "can see search results" do
    poems = PoemFacade.fetch_poem_search_results('Emily')

    expect(poems).to be_an(Array)
    expect(poems.first).to be_a(Poem)
    expect(poems.first.title).to be_a(String)
  end
end
