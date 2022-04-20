class SessionController < ApplicationController
  # bro, check here, this is how I login, understand now?
  def show
    raise ActionController::RoutingError, 'Session not found' unless verify!(params[:id])

    redirect_back fallback_location: root_path, allow_other_host: true
  end
end
