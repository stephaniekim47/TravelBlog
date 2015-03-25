class CitiesController < ApplicationController
	def create
		@country = Country.find(params[:country_id])
		@city = @country.cities.create(city_params)
		@gallery = Gallery.create({:city_id => @city.id})
		@city.gallery = @gallery
		redirect_to country_path(@country)
	end

	def new
		@country = Country.find(params[:country_id])
	end

	def destroy
		@country = Country.find(params[:country_id])
		@city = @country.cities.find(params[:id])
		@city.destroy
		redirect_to country_path(@country)
	end

	def show
		@city = City.find(params[:id])
	end

	private
		def city_params
			params.require(:city).permit(:title, :photo)
		end

end
