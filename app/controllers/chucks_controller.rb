class ChucksController < ApplicationController

  # GET /chucks
  def index
    page = params[:page] || 1
    @chucks = Chuck.page page
  end

  # GET /chucks/random
  def random 
    chuck = ChuckRequest.new
    @chuck = chuck.random_joke
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
    category = @chuck['category']
    Chuck.create(chuck_id: @chuck['id'], category: category ? category[0] : '', value: @chuck['value'])
  end

  # POST /chucks/send_chuck
  def send_chuck
    email = params[:email]
    chuck = {category: params[:category], value: params[:value]}
    ChuckMailer.send_joke(email, chuck).deliver_later
    redirect_to root_path
  end
end
