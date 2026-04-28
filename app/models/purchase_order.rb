class PurchaseOrder < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :location

  STATUSES = [ "pending", "submitted", "failed" ].freeze

  validates :vendor, :quantity, :status, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
