class CountriesController < ApplicationController
   
   

   def show
       @country = Country.find(params[:id])
   end

   def create
       @country = Country.new(country_params)

       if @country.save
          redirect_to @country
       else 
          render 'new'
        end
   end   

   def new
      @country = Country.new
   end

   def index
       @countries = Country.all
   end

   def destroy
       @country = Country.find(params[:id])
       @country.destroy
       redirect_to countries_path
   end

   def update
       @country = Country.find(params[:id])
       
       if @country.update_attributes(country_params)
        redirect_to countries_path
       else 
         render 'edit'
        end
   end

   def edit
      @country = Country.find(params[:id])

   end

   private
	def country_params
	    params.require(:country).permit(:title, :text, :photo)
	end
end
