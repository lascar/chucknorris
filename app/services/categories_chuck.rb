class CategoriesChuck
  include Callable

  def initialize
  end

  def call
    url = 'https://api.chucknorris.io/jokes/categories'
    response = RestClient::Request.execute(method: :get,url: url)
    return JSON.parse(response)
  end
end
