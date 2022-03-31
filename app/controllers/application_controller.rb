class ApplicationController < ActionController::Base
  include SessionHelper
  include ApplicationHelper
  include Pagy::Backend
  helper_method :categories
  add_flash_types :info, :error, :warning

  before_action :turbo_frame_request_variant, :apply_cookie_key!

  def categories
    @categories ||= Category.all
  end

  private

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
