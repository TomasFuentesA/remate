class Job < ApplicationRecord
  attr_accessor :position, :salary,:business,:description
  belongs_to :jobable, polymorphic: true
end
