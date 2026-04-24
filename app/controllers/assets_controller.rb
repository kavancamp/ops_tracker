class AssetsController < ApplicationController
  def index
    @assets = Asset.includes(:location)

    if params[:status].present?
      @assets = @assets.where(status: params[:status])
    end

    if params[:location_id].present?
      @assets = @assets.where(location_id: params[:location_id])
    end

    if params[:query].present?
      @assets = @assets.where("name ILIKE ?", "%#{params[:query]}%")
    end

    @assets = @assets
      .order(:name)
      .page(params[:page])
      .per(20)

    @locations = Location.order(:name)
  end

  def show
    @asset = Asset.find(params[:id])
    @maintenance_records = @asset.maintenance_records
      .order(performed_at: :desc)
      .page(params[:page])
      .per(10)
  end

  def new
    @asset = Asset.new
    @locations = Location.order(:name)
  end

  def create
    @asset = Asset.new(asset_params)
    @locations = Location.order(:name)

    if @asset.save
      redirect_to @asset, notice: "Asset created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @asset = Asset.find(params[:id])
    @locations = Location.order(:name)
  end

  def update
    @asset = Asset.find(params[:id])
    @locations = Location.order(:name)

    if @asset.update(asset_params)
      redirect_to @asset, notice: "Asset updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:name, :asset_type, :serial_number, :status, :location_id)
  end
end
