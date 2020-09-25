class Appraisal < ApplicationRecord
  mount_uploader :file_name, ListingdocUploader

  belongs_to :realty
end

def address
  "#{self.street} #{(self.number_unit).to_s}, #{self.commune.name}"
end