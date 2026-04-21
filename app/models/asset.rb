class Asset < ApplicationRecord
  belongs_to :location

  validates :name, presence: true
  validates :asset_type, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :status, presence: true
end
