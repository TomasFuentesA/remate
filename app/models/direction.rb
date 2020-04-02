class Direction < ApplicationRecord
  belongs_to :directionable, polymorphic: true
end
