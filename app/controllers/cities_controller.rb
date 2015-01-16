class CitiesController < ApplicationController
	def create
		@country = Country.find(params[:country_id])
		@city = @country.cities.create(city_params)
		redirect_to country_path(@country)
	end

	def new
		@country = Country.find(params[:country_id])
		@city = City.new
	end

	private
		def city_params
			params.require(:city).permit(:title, :photo)
		end

end
