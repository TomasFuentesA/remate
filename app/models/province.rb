class Province < ApplicationRecord
  belongs_to :region
  has_many :communes
  accepts_nested_attributes_for :communes
end
