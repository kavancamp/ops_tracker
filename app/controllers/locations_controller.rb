class LocationsController < ApplicationController
  def index
    @locations = Location.order(:name)
  end
  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location, notice: "Location created successfully"
    else
      render :new, status: :unprocressable_entity
    end
  end

  private
  def location_params
    params.require(:location).permit(:name, :region)
  end
end
