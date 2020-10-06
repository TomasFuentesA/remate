class Comprador < ApplicationRecord

  belongs_to :domain_rol


  validates :percentage, presence: true
end
