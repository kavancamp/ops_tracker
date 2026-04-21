class Location < ApplicationRecord
    has_many :assets, dependent: :destroy

    validates :name, presence: true
    validates :region, presence: true
end
