class CitiesController < ApplicationController
	before_filter :require_permission, :except => [:show, :index, :new, :create]

  	def require_permission
    	unless current_user == Country.find(params[:id]).user or current_user.try(:admin?)
          redirect_to root_path
    	end
  	end

	def create
		@country = Country.find(params[:country_id])
		@city = @country.cities.build(city_params)
		@gallery = Gallery.create({:city_id => @city.id})
		@city.gallery = @gallery
		if @city.save
			redirect_to country_path(@country)
		else
			render 'new'
		end
	end

	def new
		@country = Country.find(params[:country_id])
		@city = City.new
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
