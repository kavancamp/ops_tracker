class LocationsController < ApplicationController
  def index
    @locations = Location.order(:name)
      .page(params[:page])
      .per(20)
  end

  def show
    @location = Location.find(params[:id])

    @assets = @location.assets
      .order(:name)
      .page(params[:page])
      .per(20)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location, notice: "Location created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to @location, notice: "Location updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def location_params
    params.require(:location).permit(:name, :region)
  end
end
