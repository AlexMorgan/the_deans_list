class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
        redirect_to girls_path, notice: "#{@location.name} has been added as a vendor"
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to girls_path, notice: "#{@location.name} has been updated"
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id]).destroy

    flash[:notice] = "#{@location.name} has been deleted."
    redirect_to girls_path
  end

  protected
  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude)
  end
end
