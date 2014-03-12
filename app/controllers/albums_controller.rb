class AlbumsController < ApplicationController

	def create
		@album = Album.new(album_params)
		@album.post_id = params[:post_id]

		@album.save
		redirect_to post_path(@album.post), notice: 'image added successfully'
	end

	private

	def album_params
		params.require(:album).permit(:image)
	end
end
