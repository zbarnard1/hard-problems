class SearchController < ApplicationController
  def index
    searches = Search.all.to_json
    render json: searches
  end

  def show
  end
  
  def create
    search = Search.new(search_params)
    if search.valid?
      search.save
    else
    end
  end

  private

  def search_params
    params.require(:search).permit(:topic_id, :keyword)
  end
end
