class ApplicationController < ActionController::Base
  include SessionHelper
  helper_method :categories
  add_flash_types :info, :error, :warning

  def categories
    @categories ||= Category.all
  end
end
