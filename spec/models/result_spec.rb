require 'rails_helper'

RSpec.describe Result, type: :model do

  let(:valid_url) { "www.valid.com" }
  let(:search_id) { 1 }
  let(:page_id) { 1 }
  let(:valid_values) {{ title: "Title",
                       snippet: "Snippet",
                       url: valid_url,
                       search_id: search_id,
                       page_id: nil
                     }}

  context 'validates its properties'  do
    it 'can save a valid Result without a page id' do
      expect(Result.new(valid_values).valid?).to eq true
    end

    it 'can save a valid Result with a page id' do
      expect(Result.new(valid_values.merge({page_id: page_id})).valid?).to eq true
    end

    it 'must have a title' do
      expect(Result.new(valid_values.merge({title: nil})).valid?).to eq false
    end

    it 'must have a snippet' do
      expect(Result.new(valid_values.merge({snippet: nil})).valid?).to eq false
    end

    it 'must have a search id' do
      expect(Result.new(valid_values.merge({search_id: nil})).valid?).to eq false
    end

    it 'must have a url' do
      expect(Result.new(valid_values.merge({url: nil})).valid?).to eq false
    end
  end

  it 'expands after it has been instantiated' do
    allow(DbpediaAdapter).to receive(:expand_result)

    result = Result.create(valid_values)

    expect(DbpediaAdapter).to have_received(:expand_result).with(valid_url, result).once
  end

  xit 'knows which adapter to use'

end
