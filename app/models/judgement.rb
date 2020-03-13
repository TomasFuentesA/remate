class Judgement < ApplicationRecord
  has_one :court
  belongs_to :auction
  accepts_nested_attributes_for :court
  attr_accessor :virtual_attribute


  enum type_judgment: [:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]
  enum parts: [:Particular, :Banco_Bci,:Banco_de_Chile,:Banco_Estado,
              :Banco_Santander, :Banco_BICE,:Banco_Condell,:Banco_CrediChile,
              :Banco_Edwards_Citi, :Banco_Falabella,:Banco_Internacional,
              :Banco_Itaú,:Banco_Ripley,:Banco_Security,:Banco_CorpBanca,:Banco_Santander_Banefe,:Banco_Scotiabank,
              :Bank_of_Tokyo_Mitsubishi,:Credit_Suisse,:Deutsche_Bank,:HSBC,:J_P_Morgan,:UBS,:Doble_Impacto]



end
