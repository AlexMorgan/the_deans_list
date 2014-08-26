class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
        redirect_to girls_path, notice: "@location.name has been added as a vendor"
    else
      render :new
    end
  end

  def update

  end

  protected
  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude)
  end
end
