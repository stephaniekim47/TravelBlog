class ProfilesController < ApplicationController

	before_filter :require_permission, :except => [:show, :index, :new, :create]
	after_filter :turn_off

	def turn_off
		@on_profile = false
		@edit_profile = false
	end

	def require_permission
     	unless current_user == Profile.find(params[:id]).user or current_user.try(:admin?)
         	redirect_to root_path
      	end
  	end

	def new
		if current_user
			@profile = Profile.new
	    else
	    	flash[:notice] = "You must log in first."
	    	redirect_to new_user_session_path
	    end
	end


	def create
		@profile = Profile.where(user_id: current_user.id).first
		if @profile
			flash[:notice] = "You already have a profile."
			flash.keep
			redirect_to @profile
		elsif current_user
			@profile = Profile.new(profile_params)
			@profile.user = current_user
			if @profile.save
				redirect_to @profile 
			else
				flash[:notice] = "error in submission"
				render "new"
			end
		else
			redirect_to root_path
		end

	end

	def edit
		@profile = Profile.find(params[:id])
		@edit_profile = true
	end

	def show
		@profile = Profile.find(params[:id])
		@on_profile = true
		unless @profile
			flash[:notice] = "new profile"
			render "new"
		end
	end
   
    def index
    	@profiles = Profile.all
    end

    def destroy
    	@profile = Profile.find(params[:id])
    	@profile.destroy
    	flash[:notice] = "Profile successfully deleted."
    	redirect_to root_path
    end
 	
 	def update
 		@profile = Profile.find(params[:id])
 		if @profile.update_attributes(profile_params)
 			redirect_to profile_path
 		else
 			flash[:notice] = "Error in update."
 			render 'edit'
 		end
 	end

 	private
 	def profile_params
 		params.require(:profile).permit(:name, :photo)
 	end
end
