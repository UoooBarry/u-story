class SignImagesController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def create
    sign_image_params = params[:sign_image].permit(:src)
    @sign_image = SignImage.new(sign_image_params)

    @sign_image.save!

    respond_to do |format|
      format.json { render json: @sign_image, status: :created }
    end
  end
end
