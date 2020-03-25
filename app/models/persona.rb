class Persona < ApplicationRecord
  has_many :natural_personas

  enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]
end
