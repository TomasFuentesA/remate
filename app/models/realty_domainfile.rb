class RealtyDomainfile < ApplicationRecord
    mount_uploader :file_name, ListingdocUploader
end
