class Email < ApplicationRecord
  belongs_to :natural_person
  belongs_to :legal_person
end
