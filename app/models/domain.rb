class Domain < ApplicationRecord
  belongs_to :domainable, polymorphic: true
  has_many :inscriptions, dependent: :destroy, inverse_of: :domain
  has_many :domain_rol
  #validacion
  validates :percentage, presence: true, numericality: { less_than_or_equal_to: 100 }
end
