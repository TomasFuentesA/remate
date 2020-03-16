class Judgement < ApplicationRecord
  has_one :court
  belongs_to :auction
  accepts_nested_attributes_for :court
  attr_accessor :virtual_attribute


  enum type_judgment: [:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]
  enum parts: {Particular: "Particular", Banco_Bci: "Banco Bci",Banco_de_Chile: "Banco De Chile",Banco_Estado: "Banco Estado",
                          Banco_Santander: "Banco Santader", Banco_BICE: "Banco Bice",Banco_Condell: "Banco Condell",Banco_CrediChile: "Banco Credichile",
                          Banco_Edwards_Citi: "Banco Edwards Citi", Banco_Falabella: "Banco Falabella",Banco_Internacional: "Banco Internacional",
                          Banco_Itaú: "Banco Itaú",Banco_Ripley: "Banco Ripley",Banco_Security: "Banco Security",Banco_CorpBanca: "Banco CorpBanca",Banco_Santander_Banefe: "Banco Santander Banefe",Banco_Scotiabank: "Banco Scotiabank",
                          Bank_of_Tokyo_Mitsubishi: "Bank of Tokyo-Mitsubishi",Credit_Suisse: "Credit Suisse",Deutsche_Bank: "Deutsche Bank",HSBC:"HSBC",J_P_Morgan: "Bank J.P Morgan",UBS: "UBS",Doble_Impacto: "Doble Impacto"}



end
