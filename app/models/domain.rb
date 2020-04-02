class Domain < ApplicationRecord
  belongs_to :domainable, polymorphic: true, opcional: true
  has_many :inscriptions

end
