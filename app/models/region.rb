class Region < ApplicationRecord
  has_many :provinces
  accepts_nested_attributes_for :provinces
  


  def direction
    "#{self.name}"
  end



end
