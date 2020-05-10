class Inscription < ApplicationRecord
  belongs_to :domain, inverse_of: :inscriptions
end
