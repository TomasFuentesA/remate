class Document < ApplicationRecord
  mount_uploader :domain_title, ListingdocUploader
  mount_uploader :gp, ListingdocUploader
  mount_uploader :tax_appraisal, ListingdocUploader

  belongs_to :realty
end
