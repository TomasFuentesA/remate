class LegalPersona < ApplicationRecord
  #asociaciones y atributos anidados
  has_many :jobs, as: :jobable, dependent: :destroy
  has_many :emails, as: :emailable,dependent: :destroy
  has_many :phones, as: :phoneable,dependent: :destroy
  has_many :directions, as: :directionable,dependent: :destroy
  has_many :legal_represents,dependent: :destroy
  has_many :domains, as: :domainable
  has_many :activities, as: :activityable
  accepts_nested_attributes_for :legal_represents, allow_destroy: true

  #validacion
  validates :rut,:name, presence: true
  validates :rut,:name, uniqueness: true




end
