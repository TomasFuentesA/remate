class Judgement < ApplicationRecord
  #belongs_to :auction, inverse_of: :judgement
  belongs_to :court
  has_many :auctions, dependent: :destroy
  has_many :judicialfiles, dependent: :destroy
  has_many :judgement_debt, dependent: :destroy
  enum type_judgement: [:por_definir,:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]

  #validacion
  #validates :demandante, presence: true, uniqueness: true

  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s}"
  end

  def name_judgement
    "#{self.demandante} - #{(self.demandado)}"
  end
  
  def full_name_judgement
    "#{self.court.name} - #{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s} - #{self.demandante} / #{(self.demandado)}"
  end

end
