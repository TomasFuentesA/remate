class LegalPersona < ApplicationRecord
  #asociaciones y atributos anidados
  has_many :jobs, as: :jobable, dependent: :destroy
  has_many :emails, as: :emailable,dependent: :destroy
  has_many :phones, as: :phoneable,dependent: :destroy
  has_many :directions, as: :directionable, dependent: :destroy
  has_many :domains, as: :domainable, dependent: :destroy
  has_many :activities, as: :activityable
  has_many :legal_represents, dependent: :destroy
  has_many :condominios, dependent: :destroy
  

  #asociation inter personas
  has_many :persona_members, dependent: :destroy
  has_many :personas, through: :persona_members
  #has_many :legal_members
  #has_many :legal_asociados, through: :legal_members


  #validacion
  validates :rut,:name, presence: true, uniqueness: true
  validates :notario, presence: true

  def persona_already_added?(persona)
    personas.where(id: persona.id).exists?
  end

  def personas_limit?
    personas.count < 6
  end

  def can_track_stock?(ticker_symbol)
    personas_limit? && !persona_already_added?(persona)
  end

end
