class Api::ArticlesController < ApplicationController
  def index
    # get the data from the api
    search_term = params[:search]
    response = HTTP.get("http://newsapi.org/v2/everything?q=#{search_term}&from=2020-02-24&sortBy=publishedAt&apiKey=#{Rails.application.credentials.news_api[:api_key]}")
    @articles = response.parse
    # send that data to the view
    render 'index.json.jb'
  end
end
