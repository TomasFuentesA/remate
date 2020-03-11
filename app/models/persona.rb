class Persona < ApplicationRecord
  has_many :activities
  accepts_nested_attributes_for :activities


  enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]
end
