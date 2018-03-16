class ChucksController < ApplicationController

  # GET /chucks
  def index
    page = params[:page] || 1
    @chucks = Chuck.page params[:page]
  end

  # GET /chucks/random
  def random 
    chuck = ChuckRequest.new
    @value = chuck.random_joke
  end

  # GET /chucks/search
  def search
    chuck = ChuckRequest.new
    @categories = chuck.categories
  end

  # POST /chucks/search_results
  def search_results
    category = params[:category]
    chuck = ChuckRequest.new
    @chuck = chuck.search(category)
    Chuck.create(chuck_id: @chuck['id'], category: @chuck['category'] ? @chuck['category'][0] : '', value: @chuck['value'])
  end

end
