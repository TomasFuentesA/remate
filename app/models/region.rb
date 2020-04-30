class Region < ApplicationRecord
  has_many :provinces, dependent: :destroy, inverse_of: :region
  accepts_nested_attributes_for :provinces



  def direction
    "#{self.name}"
  end



end
