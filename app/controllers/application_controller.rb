class ApplicationController < ActionController::Base
  include SessionHelper
  helper_method :categories

  def categories
    @categories ||= Category.all
  end
end
