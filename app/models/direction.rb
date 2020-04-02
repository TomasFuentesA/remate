class Direction < ApplicationRecord
  belongs_to :directionable, polymorphic: true, opcional: true
end
