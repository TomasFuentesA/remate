class Domain < ApplicationRecord
  belongs_to :domainable, polymorphic: true
  has_many :inscriptions, dependent: :destroy, inverse_of: :domain

end
