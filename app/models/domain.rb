class Domain < ApplicationRecord
  belongs_to :domainable, polymorphic: true
  has_many :inscriptions

end
