class AuctionsRecord < ApplicationRecord
    mount_uploader :file_name, ListingdocUploader

end
