class Domain < ApplicationRecord
  attr_accessor :type_modality, :price,:date_posetion,:percentage
  belongs_to :domainable, polymorphic: true
  has_many :inscriptions

end
