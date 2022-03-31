class HomeController < ApplicationController
  def index
    @pagy, @articles = pagy(Article.all.includes(:category).order(created_at: :desc), items: 5)
  end
end
