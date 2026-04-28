class Location < ApplicationRecord
    has_many :assets, dependent: :destroy
    has_many :inventory_items, dependent: :destroy
    has_many :purchase_orders, dependent: :destroy

    validates :name, presence: true, uniqueness: { scope: :region, case_sensitive: false }
    validates :region, presence: true
end
