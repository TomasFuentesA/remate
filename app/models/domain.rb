class Domain < ApplicationRecord
  belongs_to :natural_persona
  belongs_to :legal_persona
  has_many :inscriptions

end
