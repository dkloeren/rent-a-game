class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile.update(params_profile)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
    # only show after registering
  end

  def edit
  end

  def update
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def params_profile
    params.require(:profile).permit(:first_name, :last_name, :address, :image)
  end
end
