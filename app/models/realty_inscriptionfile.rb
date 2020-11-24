class RealtyInscriptionfile < ApplicationRecord
  mount_uploader :file_name, ListingdocUploader
  
  belongs_to :realty_inscription
end
