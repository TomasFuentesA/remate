class Rubro < ApplicationRecord
    validates :nombre, uniqueness: true 
end
