class Asset < ApplicationRecord
  belongs_to :location
  has_many :maintenance_records, dependent: :destroy

  VALID_STATUSES = [ "active", "maintenance", "retired" ].freeze

  validates :name, presence: true
  validates :asset_type, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }

  def needs_attention?
    status == "maintenance"
  end
end
