class AlbumsController < ApplicationController
 before_action :set_post
 before_action :set_album, only: [:edit, :update, :destroy]
  

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

  
  
  
  
  