class Condominio < ApplicationRecord
  #belongs_to :legal_persona

  
  #belongs_to :persona
  belongs_to :commune
  has_many :realty, dependent: :destroy


    #validacion
    validates :name,:address, presence: true, uniqueness: true
end
