class NaturalPersona < ApplicationRecord
  has_one :job
  has_one :email
  has_one :phone
  has_one :direction
  has_many :domains
  accepts_nested_attributes_for :phone
  accepts_nested_attributes_for :direction
  accepts_nested_attributes_for :email
  accepts_nested_attributes_for :job
  enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]  

end
