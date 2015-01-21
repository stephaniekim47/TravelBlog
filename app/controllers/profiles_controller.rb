class ProfilesController < ApplicationController

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(params[:id])
		@profile.user = current_user
		if @profile.save
			redirect_to root_path
		else
			render "new"
		end

	end


end
