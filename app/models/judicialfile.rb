class Judicialfile < ApplicationRecord
  mount_uploader :file_name, ListingdocUploader

  belongs_to :judgement
  
end
