class SearchChuck
  include Callable

  def initialize(category)
    @category = category
  end

  def call
    url = 'https://api.chucknorris.io/jokes/random?category=' + @category
    response = RestClient::Request.execute(method: :get,url: url)
    return JSON.parse(response)
  end
end
