class Email < ApplicationRecord
  belongs_to :natural_persona
  belongs_to :legal_persona
end
