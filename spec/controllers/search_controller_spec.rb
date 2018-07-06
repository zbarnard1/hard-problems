require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  let(:valid_search) { Search.new(topic_id: 1) }
  let(:invalid_search) { Search.new() }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.successful?).to be(true)
    end
  end

  describe "POST #create" do
    before(:all) { Topic.create(id: 1) }
    after(:all) { Topic.destroy_all }

    it "creates a new search and saves it if valid" do
      allow(Search).to receive(:new).and_return(valid_search)
      allow(valid_search).to receive(:save)

      post :create, params: { search: { topic_id: 1 } }
      expect(valid_search).to have_received(:save)
    end

    it "only persists a valid search" do
      allow(Search).to receive(:new).and_return(invalid_search)
      allow(invalid_search).to receive(:save)

      post :create, params: { search: { topic_id: 0 } }
      expect(invalid_search).to_not have_received(:save)
    end
  end

  describe "GET #show" do
    
  end

end


=begin
describe "guest access" do
  describe 'GET #new' do
    it "requires login" do
      get :new
      expect(response).to redirect_to login_url
    end
  end

  describe "POST #create" do
    it "requires login" do
      post :create, contact: FactoryGirl.attributes_for(:contact)
      expect(response).to redirect_to login_url
    end
  end

  # other examples ...
end
=end