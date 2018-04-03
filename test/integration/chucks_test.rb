require 'test_helper.rb'
class ChucksTest < Capybara::Rails::TestCase
  def setup
    @first = chucks :chuck_1
    @second = chucks :chuck_2
    @categories =  1.upto(10).map{|i| "category_" + i.to_s}
	  random_chuck = @first.to_json
		stub_request(:get, "https://api.chucknorris.io/jokes/random").
					with(  headers: {
						'Accept'=>'*/*',
						'Accept-Encoding'=>'gzip, deflate',
						'Host'=>'api.chucknorris.io',
						'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.0p0'
						}).
					to_return(status: 200, body: random_chuck, headers: {})
		stub_request(:get, "https://api.chucknorris.io/jokes/categories").
					with(  headers: {
						'Accept'=>'*/*',
						'Accept-Encoding'=>'gzip, deflate',
						'Host'=>'api.chucknorris.io',
						'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.0p0'
						}).
					to_return(status: 200, body: @categories.to_json, headers: {})
    @chuck = {category: "some_cat", id: "yOWy78MrRqSkz0un4QMzYA", value: "Some Chuck joke"}.to_json
		stub_request(:get, "https://api.chucknorris.io/jokes/random?category=category_2").
					with(query: {category: "category_2"}, headers: {
						'Accept'=>'*/*',
						'Accept-Encoding'=>'gzip, deflate',
						'Host'=>'api.chucknorris.io',
						'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.0p0'
						}).
					to_return(status: 200, body: @chuck, headers: {})
  end

  test 'chucks index' do
    visit chucks_path(locale:"es")

    assert page.has_content?(@first.value)
    assert page.has_content?(@second.value)
  end

  # no test for pagination

  test 'chucks random' do
    visit random_path(:es)

    assert page.has_content?(@first.value)
  end

  test 'chucks search_results' do
    visit search_path(:es)
    within('#form-search') do
      select(@categories[1], :from => 'category')
      find('input[name="commit"]').click
    end
    assert page.has_content? "Chuck Broma : " + JSON.parse(@chuck)["value"]
    assert ! Chuck.find_by_value(JSON.parse(@chuck)["value"]).nil?
  end

  test 'chunks send_chuck' do
    #
  end
end
