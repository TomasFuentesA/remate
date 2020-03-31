class LegalPersona < ApplicationRecord
  #asociaciones y atributos anidados
  has_many :jobs, as: :jobable
  has_many :emails, as: :emailble
  has_many :phones, as: :phoneable
  has_many :directions, as: :directionable
  has_many :legal_represents
  has_many :domains, as: :domainable
  has_many :activities, as: :activityable

  #validacion
  validates :rut,:name, presence: true
  validates :rut,:name, uniqueness: true

end
