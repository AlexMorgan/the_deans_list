class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
