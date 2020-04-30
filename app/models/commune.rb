class Commune < ApplicationRecord
  belongs_to :province
  has_many :realties, dependent: :destroy
  has_many :condominios, dependent: :destroy
end
