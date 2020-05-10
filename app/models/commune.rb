class Commune < ApplicationRecord
  belongs_to :province, inverse_of: :communes
  has_many :realties, dependent: :destroy
  has_many :condominios, dependent: :destroy
end
