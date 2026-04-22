class Location < ApplicationRecord
    has_many :assets, dependent: :destroy

    validates :name, presence: true, uniqueness: { scope: :region, case_sensitive: false }
    validates :region, presence: true
end
