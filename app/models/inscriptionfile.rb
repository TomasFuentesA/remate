class Inscriptionfile < ApplicationRecord
    mount_uploader :file_name, ListingdocUploader
  
    #require 'docx'
  
    belongs_to :inscription
    
end
  