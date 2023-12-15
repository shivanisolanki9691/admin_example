class PicturesController < ApplicationController
    # skip_before_action :validation_json_web_token, :only => [:create, :index, :destroy]
    def create
      @image = Picture.new(images: params[:image])
      if @image.save
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    def index
      @image = Picture.all
      if @image.present?
        render json: { errors: [{ message: 'something wrong' }] }, status: :unprocessable_entity
      end
    end
   
    def destroy
      @image = Picture.find_by(id: params[:id])
      return render json: { error: 'not Found' } unless Picture.present?
      @image&.destroy
      render json: { success: "removed successfully" }, status: :ok
    end