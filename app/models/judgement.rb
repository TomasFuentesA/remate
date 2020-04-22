class Judgement < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :auction
  accepts_nested_attributes_for :parts

  enum type_judgement: [:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]



end
