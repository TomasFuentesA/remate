class PersonaMember < ApplicationRecord
  belongs_to :persona
  belongs_to :legal_persona
end
