class TypeRealty < ApplicationRecord
  belongs_to :realty

  enum tipo: [:casa, :departamento, :local, :oficina, :bodega, :sitio, :estacionamiento, :parcela]

end
