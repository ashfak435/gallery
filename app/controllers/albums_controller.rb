class AlbumsController < ApplicationController
 
  def index
    #  @albums = current_admin.albums
      @q = Album.ransack(params[:q])
  @albums= @q.result.includes(:taggings, :tags)
  end

  def new 
    @album=Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render :new
    end
   
  end

  
  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album=Album.find(params[:id])
  end

  def destroy
      @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def delete_upload
    
  attachment = ActiveStorage::Attachment.find_by(id: params[:upload_id])
  attachment.purge
  redirect_back(fallback_location: albums_path)
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      flash[:success] = "Saved"
      redirect_to @album
    else
      flash[:error] = "Not saved"
      render :edit
    end
  end
 private
    def album_params
      params.require(:album).permit(:title, :admin_id, :discription, :all_tags,:published, images: [])
    end 
end


