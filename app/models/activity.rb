class Activity < ApplicationRecord
  has_many :people
  has_many :natural_people
end
