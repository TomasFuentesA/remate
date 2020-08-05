class Persona < ApplicationRecord
  #relaciones
  has_many :emails, as: :emailable,dependent: :destroy
  has_many :phones, as: :phoneable,dependent: :destroy
  has_many :directions, as: :directionable,dependent: :destroy
  has_many :domains, as: :domainable
  has_many :activities, as: :activityable
  has_many :condominios, dependent: :destroy

  #inter relation
  has_many :persona_members
  has_many :legal_personas, through: :persona_members


  #nested relation
  has_one :job, dependent: :destroy
  accepts_nested_attributes_for :job,  allow_destroy: true

  #validacion
  validates :rut,:name, uniqueness: true, presence: true


  enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]


  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end


  def full_name_persona
    "#{self.name} #{self.name2} #{self.last_name1} #{self.last_name2}"
  end

end
