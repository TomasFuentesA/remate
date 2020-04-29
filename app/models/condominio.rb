class Condominio < ApplicationRecord
  belongs_to :persona
  belongs_to :legal_persona
  belongs_to :realty
  belongs_to :commune
end
