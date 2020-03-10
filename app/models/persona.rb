class Persona < ApplicationRecord
enum e_civil_type: [:single, :married_separation, :married_marital, :divorced, :vidower, :cohabiting]
end
