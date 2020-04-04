class Direction < ApplicationRecord
  attr_accessor :direction_a, :direction_b,:direction_c  
  belongs_to :directionable, polymorphic: true
end
