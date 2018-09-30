class PhotosController < ApplicationController
  before_action :authenticate_user!
  layout 'site'
  before_action :set_photo, only: [:edit, :update, :destroy]
  before_action :set_album

  def index
    @photos = @album.photos.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @photo = Photo.new
  end

  def edit
  end
  def create
    @photo = @album.photos.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to album_photos_path(@album), notice: 'Photo added successfully .'
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to album_photos_path(@album), notice: 'Photo successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    redirect_to album_photos_path(@album), notice: 'Photo  successfully deleted.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.friendly.find(params[:id])
    end

    def set_album
      @album = Album.friendly.find(params[:album_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:tagline, :image)
    end
end
