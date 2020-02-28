class Activity < ApplicationRecord
  belongs_to :person
  has_many :natural_people
  has_many :legal_people
end
