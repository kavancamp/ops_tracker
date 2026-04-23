class MaintenanceRecord < ApplicationRecord
  belongs_to :asset

  validates :performed_at, presence: true
  validates :vendor, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :notes, presence: true
end
