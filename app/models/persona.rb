class Persona < ApplicationRecord
  #relaciones
  has_many :jobs, as: :jobable, dependent: :destroy
  has_many :emails, as: :emailable,dependent: :destroy
  has_many :phones, as: :phoneable,dependent: :destroy
  has_many :directions, as: :directionable,dependent: :destroy
  has_many :domains, as: :domainable
  has_many :activities, as: :activityable

  #validacion
  validates :rut,:name, presence: true
  validates :rut,:name, uniqueness: true


  enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]
end
