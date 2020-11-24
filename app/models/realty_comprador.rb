class RealtyComprador < ApplicationRecord
  #belongs_to :realty_domainrol

  validates :percentage, presence: true, numericality: { less_than_or_equal_to: 100 }
  validates :percentage, presence: true, numericality: { greather_than: 0 }

  validates :precio, presence: true, numericality: { greather_than: 0 }
end
