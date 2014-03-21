class AlbumsController < ApplicationController
  before_action :set_post
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  
  def new
    @album = @post.albums.build
  end
  
  def create
    @album = @post.albums.build(album_params)
    if @album.save
      flash[:notice] = "Post was created and an image was added"
      redirect_to [@post]
    else
      flash[:alert] = "Images were not added"
      render 'new'
    end
  end
  

	private

	def album_params
		params.require(:album).permit(:image)
	end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def set_album
    @album = @post.albums.find(params[:id])
  end
end

  
  
  
  
  