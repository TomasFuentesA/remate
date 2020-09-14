class PersonaMember < ApplicationRecord
  belongs_to :legal_persona

  #validacion
  validates :percentage, presence: true, numericality: { less_than_or_equal_to: 100 }
end
