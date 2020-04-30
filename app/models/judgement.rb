class Judgement < ApplicationRecord
  belongs_to :auction, inverse_of: :judgements
  enum type_judgement: [:por_definir,:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]
end
