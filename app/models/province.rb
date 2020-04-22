class Province < ApplicationRecord
  belongs_to :region
  has_many :communes, dependent: :destroy
  accepts_nested_attributes_for :communes
end
