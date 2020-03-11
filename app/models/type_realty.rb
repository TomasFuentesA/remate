class TypeRealty < ApplicationRecord
  belongs_to :realty

  enum property: [:casa, :departmento, :local, :oficina, :bodega, :sitio, :estacionamiento, :parcela]
end
