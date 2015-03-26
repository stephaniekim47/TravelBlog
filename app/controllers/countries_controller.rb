class CountriesController < ApplicationController
   
  before_filter :require_permission, :except => [:show, :index, :new, :create]


   def require_permission
    unless current_user == Country.find(params[:id]).user or current_user.try(:admin?)
          redirect_to root_path
    end
  end

   def show
       @country = Country.find(params[:id])
   end

   def create
      @country = Country.new(country_params)
      @country.user = current_user

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
