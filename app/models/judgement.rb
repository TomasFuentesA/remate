class Judgement < ApplicationRecord
  has_one :court
  has_many :parts
  belongs_to :auction
  accepts_nested_attributes_for :parts
  accepts_nested_attributes_for :court
end
