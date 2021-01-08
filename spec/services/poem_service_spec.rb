require 'rails_helper'

describe PoemService do
  context '#poems' do
    it "returns expected data" do
      service = PoemService.new

      results = service.poem_by_author('Emily')
      expect(results).to be_an(Array)
      expect(results.count).to eq(10)

      first_poem = results.first
      
      expect(first_poem).to have_key(:title)
      expect(first_poem[:title]).to eq("Not at Home to Callers")
      expect(first_poem).to have_key(:author)
      expect(first_poem[:author]).to eq("Emily Dickinson")
      expect(first_poem).to have_key(:lines)
      expect(first_poem[:lines]).to eq([
              "Not at Home to Callers",
              "Says the Naked Tree --",
              "Bonnet due in April --",
              "Wishing you Good Day --"
          ])
    end
  end
end
