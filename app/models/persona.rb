class Persona < ApplicationRecord
  #relaciones
  has_many :jobs, as: :jobable, dependent: :destroy
  has_many :emails, as: :emailable,dependent: :destroy
  has_many :phones, as: :phoneable,dependent: :destroy
  has_many :directions, as: :directionable,dependent: :destroy
  has_many :domains, as: :domainable
  has_many :activities, as: :activityable

  #inter relation
  has_many :persona_members
  has_many :legal_personas, through: :persona_members

  #validacion
  validates :rut,:name, uniqueness: true, presence: true


  enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]


  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end
end
