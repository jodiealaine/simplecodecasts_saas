class ProfilesController < ApplicationController
	 def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile
  end
  def create
  	@user = User.find( params[:user_id] )
  	@profile = @user.build_profile(profile_params)
  	if @profile.save
  		flash[:sucess] = "Profile updated!"
  		redirect_to user_path( params[:user_id] )
  	else
  		render action: :new
  	end
  end
end