class GalleriesController < ApplicationController
	def show
		@gallery = Gallery.find(params[:id])
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
		p = @gallery.gallery_photos.build(gallery_params)
		p.save
		render 'show'
	end

	def destroy
		if params[:photo_id]
			GalleryPhoto.delete(params[:photo_id])
		end
		redirect_to 'show'
	end

	private
		def gallery_params
			params.require(:gallery).permit(:photo)
		end

end
