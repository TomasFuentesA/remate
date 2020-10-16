class JudgementDebt < ApplicationRecord
    belongs_to :judgement

    enum type_judgement_debt: {'crédito hipotecario'=>0, 'deuda ejecutiva'=>1, 'tesorería'=>2}

end
  