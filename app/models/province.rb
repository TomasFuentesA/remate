class Province < ApplicationRecord
  belongs_to :region, inverse_of: :provinces
  has_many :communes, dependent: :destroy, inverse_of: :province

end
