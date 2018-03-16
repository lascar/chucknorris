class ChuckRequest
  def random_joke
    url = 'https://api.chucknorris.io/jokes/random'
    response = RestClient::Request.execute(method: :get,url: url)
    json_response = JSON.parse(response)
    return json_response['value']
  end

  def categories
    url = 'https://api.chucknorris.io/jokes/categories'
    response = RestClient::Request.execute(method: :get,url: url)
    return JSON.parse(response)
  end

  def search(category)
    url = 'https://api.chucknorris.io/jokes/random?category=' + category
    response = RestClient::Request.execute(method: :get,url: url)
    return JSON.parse(response)
  end
end
