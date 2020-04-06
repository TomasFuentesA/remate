class LegalPersona < ApplicationRecord
  #asociaciones y atributos anidados
  has_many :jobs, as: :jobable, dependent: :destroy
  has_many :emails, as: :emailable,dependent: :destroy
  has_many :phones, as: :phoneable,dependent: :destroy
  has_many :directions, as: :directionable,dependent: :destroy
  has_many :domains, as: :domainable, dependent: :destroy
  has_many :activities, as: :activityable
  has_many :legal_represents, dependent: :destroy
  

  #validacion
  validates :rut,:name, presence: true
  validates :rut,:name, uniqueness: true




end
