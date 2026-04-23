class MaintenanceRecordsController < ApplicationController
  def new
    @asset = Asset.find(params[:asset_id])
    @maintenance_record = @asset.maintenance_records.new
  end

  def create
    @asset = Asset.find(params[:asset_id])
    @maintenance_record = @asset.maintenance_records.new(maintenance_record_params)

    if @maintenance_record.save
      redirect_to @asset, notice: "Maintenance record added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def maintenance_record_params
    params.require(:maintenance_record).permit(:performed_at, :vendor, :cost, :notes)
  end
end