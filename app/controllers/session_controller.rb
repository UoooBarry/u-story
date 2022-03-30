class SessionController < ApplicationController
  def show
    raise ActionController::RoutingError, 'Session not found' unless verify!(params[:id])

    redirect_to root_path
  end
end
