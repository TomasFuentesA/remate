class Judgement < ApplicationRecord
  #belongs_to :auction, inverse_of: :judgement
  belongs_to :court

  enum type_judgement: [:por_definir,:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]

  #validacion
  #validates :demandante, presence: true, uniqueness: true

  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s} > #{self.demandante} / #{self.demandado}"
  end

  
end
