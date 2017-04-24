class UploadersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @uploaders = Uploader.all
  end

  def new
    @uploader = current_user.uploaders.new
  end

  def create
    @uploader = current_user.uploaders.new(uploader_params)

    if @uploader.save
      flash[:notice] = "Image Uploaded"
      redirect_to uploaders_path
    else
      render :new
    end
  end

  def destroy
    @uploader = current_user.uploaders.find(params[:id])
    @uploader.destroy
    flash[:alert] = "Image Deleted"
    redirect_to uploaders_path
  end

  private
  def uploader_params
    params.require(:uploader).permit(:uploaded_image)
  end
end
