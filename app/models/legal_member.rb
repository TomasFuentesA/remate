class LegalMember < ApplicationRecord
  belongs_to :legal_persona
  belongs_to :legal_asociado, class_name: "LegalPersona"
end
