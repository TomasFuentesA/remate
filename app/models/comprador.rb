class Comprador < ApplicationRecord

  belongs_to :domain_rol


  validates :percentage, presence: true
  validates :persona_id, presence: true, numericality: { greater_than: 0}
end
