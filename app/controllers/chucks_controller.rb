class ChucksController < ApplicationController

  # GET /chucks
  def index
    page = params[:page] || 1
    @chucks = Chuck.page page
  end

  # GET /chucks/random
  def random 
    @chuck = RandomChuck.call
  end

  # GET /chucks/search
  def search
    @categories = CategoriesChuck.call
  end

  # POST /chucks/search_results
  def search_results
    @chuck = SearchChuck.call(params[:category])
    SaveChuck.call(@chuck)
  end

  # POST /chucks/send_chuck
  def send_chuck
    email = params[:email]
    chuck = {category: params[:category], value: params[:value]}
    ChuckMailer.send_joke(email, chuck).deliver_later
    redirect_to root_path
  end
end
