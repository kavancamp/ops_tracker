class DashboardController < ApplicationController
  def index
    @locations_count = Location.count
    @assets_count = Asset.count
    @active_assets_count = Asset.where(status: "active").count
    @maintenance_assets_count = Asset.where(status: "maintenance").count
    @retired_assets_count = Asset.where(status: "retired").count
    @recent_maintenance_records = MaintenanceRecord.includes(asset: :location)
      .order(performed_at: :desc)
      .limit(5)
    @attention_assets = Asset.where(status: "maintenance").limit(5)
  end
end
