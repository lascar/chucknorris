class RandomChuck
  include Callable

  def initialize
  end

  def call
    url = 'https://api.chucknorris.io/jokes/random'
    response = RestClient::Request.execute(method: :get,url: url)
    json_response = JSON.parse(response)
    return json_response
  end
end
