class NaturalPerson < ApplicationRecord
  belongs_to :activity
  has_many :domains
  has_one :direction
  has_one :job
  has_one :email
  has_one :phone
end
