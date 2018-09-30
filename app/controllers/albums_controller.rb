class AlbumsController < ApplicationController
  before_action :authenticate_user!
  layout 'site'
  before_action :set_album, only: [:edit, :update, :destroy]

  def index
    @albums = current_user.albums.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      redirect_to @album, notice: 'Album was successfully created.' 
    else
     render :new 
    end
  end

  def update
    if @album.update(album_params)
      redirect_to albums_url, notice: 'Album was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.friendly.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :slug)
    end
end
