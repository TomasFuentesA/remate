class TypeRealty < ApplicationRecord
  belongs_to :realty

  enum tipo: [:casa, :departmento, :local, :oficina, :bodega, :sitio, :estacionamiento, :parcela]

end
