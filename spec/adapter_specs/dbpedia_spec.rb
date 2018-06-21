require 'rails_helper'


RSpec.describe DbpediaAdapter do
  let(:dbpa) { DbpediaAdapter.new }
  let(:no_keyword_msg) { 'you must specify a keyword to use for this search of Dbpedialite' }
  let(:search_url_term_eq) { 'http://localhost:4567/search.json?term=' }
  let(:result_data) {[
    {"ns":0,
     "title":"Horse",
     "pageid":13645,
     "snippet":"live in the wild as feral <span class=\"searchmatch\">horses</span>. These feral populations are not true wild <span class=\"searchmatch\">horses</span>, as this term is used to describe <span class=\"searchmatch\">horses</span> that have never been domesticated",
     "titlesnippet":"<span class=\"searchmatch\">Horse</span>",
     "url":"/titles/Horse"},
    {"ns":0,"title":"Horse racing",
     "pageid":74711,
     "snippet":"<span class=\"searchmatch\">Horse</span> racing is an equestrian performance sport, typically involving two or more <span class=\"searchmatch\">horses</span> ridden by jockeys (or sometimes driven without riders) over a",
     "titlesnippet":"<span class=\"searchmatch\">Horse</span> racing",
     "url":"/titles/Horse_racing"},
    {"ns":0,"title":"Horse breeding",
     "pageid":14082,
     "snippet":"<span class=\"searchmatch\">Horse</span> breeding is reproduction in <span class=\"searchmatch\">horses</span>, and particularly the human-directed process of selective breeding of animals, particularly purebred <span class=\"searchmatch\">horses</span> of",
     "titlesnippet":"<span class=\"searchmatch\">Horse</span> breeding",
     "url":"/titles/Horse_breeding"}
  ]}


  it 'should pass the smoke test' do
    expect(dbpa).to be_an_instance_of(DbpediaAdapter)
  end

  # for testing webmock 
  feature 'External request' do
      
  it 'queries FactoryGirl contributors on GitHub' do
    stub_request(:get, /api.github.com/).
        #with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: "stubbed response", headers: {})

    uri = 'https://api.github.com/repos/thoughtbot/factory_girl/contributors'

    response = RestClient.get(uri)
    expect(response.body).to be_an_instance_of(String)
  end
end

  it 'checks that the local Dbpedialite is running'

  # internal behavior

  it 'uses the configuration information for the local dbpedialite program'

  it 'instantiates Result objects'

  # external behavior

    # used by a Search object
  describe '#search' do
    it 'takes a keyword' do
      stub_request(:get, search_url_term_eq + 'horse').
        to_return(status: 200, body: "{this_is_a_json_key: ['here is the json value']}", headers: {})

      expect{dbpa.search('horse')}.to_not raise_error
    end

    it 'raises an error if there is no keyword' do
      expect{dbpa.search('')}.to raise_error(no_keyword_msg)
      expect{dbpa.search()}.to raise_error(no_keyword_msg)
    end

    it 'creates the right URL for a dbpedia search' do
      expect(dbpa.send(:create_url, 'horse')).to eq(search_url_term_eq + 'horse')
    end

    it 'returns an array of Results' do
      stub_request(:get, search_url_term_eq + 'horse').
        to_return(status: 200, body: result_data.to_json, headers: {})

      expect(dbpa.search('horse')).to be_a_kind_of(Array)
      expect(dbpa.search('horse')[0]).to be_a_kind_of(Result)
      expect(dbpa.search('horse').length).to eq(3)
    end

  end


    # used by a Result object
  describe '#expand_result' do
    it 'gets the abstract'

  end

end
