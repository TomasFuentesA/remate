class Activity < ApplicationRecord
  belongs_to :persona
  has_many :natural_personas
  has_many :legal_personas
end
