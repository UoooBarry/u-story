class HomeController < ApplicationController
  def index
    @articles = Article.all.includes(:category)
  end
end
