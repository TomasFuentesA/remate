class LegalPerson < ApplicationRecord
  has_many :domains
  belongs_to :activity
  has_one :direction
  has_one :job
  has_one :email
  has_one :phone
end
