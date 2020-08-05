class Appraisal < ApplicationRecord
  belongs_to :realty
end

def address
  "#{self.street} #{(self.number_unit).to_s}, #{self.commune.name}"
end