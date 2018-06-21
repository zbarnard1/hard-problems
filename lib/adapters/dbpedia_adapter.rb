class DbpediaAdapter

  def initialize
    # get port from config file here, confirm that it is open
  end

  def search(keyword='')
    if keyword == ''
      raise 'you must specify a keyword to use for this search of Dbpedialite'
    else
      response = RestClient::Request.execute( method: :get, url: create_url(keyword))
    end
  end

private

  def create_url(term)
    'http://localhost:4567/search.json?term=' + term
  end

end