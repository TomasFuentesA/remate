class Realty < ApplicationRecord
    after_create :set_latlon
    belongs_to :commune
    has_one :characteristic
    has_one :type_realty
    accepts_nested_attributes_for :characteristic , allow_destroy: true
    accepts_nested_attributes_for :type_realty , allow_destroy: true


    has_many :auctions

    enum street_type: [:street, :avenue, :passage]
    enum type_property: [:house, :department, :local, :office, :cellar, :site, :box, :parcela]

    geocoded_by :address
    after_validation :geocode

    def address
      "#{self.street} #{(self.number_unit).to_s}, #{self.commune.name}"
    end

    def appraisal_role
      "#{(self.apple).to_s} - #{(self.property).to_s}-#{self.commune.name}"
    end



    private

    def set_latlon
      latlon = Geocoder.search(self.address).first.coordinates
      self.update(latitude: latlon[0], longitude: latlon[1])
    end


end
