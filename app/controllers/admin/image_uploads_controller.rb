# app/controllers/admin/image_uploads_controller.rb
class Admin::ImageUploadsController < ApplicationController
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: { url: @image.image.url }
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
