class Realty < ApplicationRecord
    #validacion de campos
    #validates :address, presence: true, uniqueness: true
    #validates :street, :number_unit, :unit_estate, presence: true


    after_create :set_latlon
    #asociacion de modelos
    has_many :auctions, dependent: :destroy
    has_one :characteristic, dependent: :destroy
    has_one :type_realty, dependent: :destroy
    belongs_to :commune
    belongs_to :condominio
    has_many :appraisal, dependent: :destroy
    #has_many :auctionnotices , dependent: :destroy

    #atributos anidados
    accepts_nested_attributes_for :characteristic,  allow_destroy: true
    accepts_nested_attributes_for :type_realty , allow_destroy: true




    enum street_type: [:street, :avenue, :passage]
    enum type_property: [:house, :department, :local, :office, :cellar, :site, :box, :parcela]
    enum destination: [:Habitacional, :Comercio, :Oficina, :Industria, :Bodega, :Estacionamiento, :Educacion, :Culto, :Eriazo, :Agricola ]

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
      begin
        latlon = Geocoder.search(self.address).first.coordinates
        self.update(latitude: latlon[0], longitude: latlon[1])
      rescue Exception => error
        Rails.logger.info "error mapa direccion"
      end
    end


end
