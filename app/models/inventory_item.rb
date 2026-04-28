class InventoryItem < ApplicationRecord
  belongs_to :location
  has_many :purchase_orders, dependent: :destroy

  validates :name, :quanity, :reorder_threshold, :reorder_amount, :vendor, presence: true
  validates :quanity, :reorder_threshold, :reorder_amount, numericality: { greater_than_or_equal_to: 0 }

  def needs_reorder?
    quanity <= reorder_threshold
  end

  after_save :create_purchase_order_if_needed

  private

  def create_purchase_order_if_needed
    return unless needs_reorder?
    return if purchase_orders.where(status: "pending").exists?

    purchase_orders.create!(
      location: location,
      vendor: vendor,
      quantity: reorder_amount,
      status: "pending"
    )
  end
end
