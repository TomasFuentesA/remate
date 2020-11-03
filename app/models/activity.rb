class Activity < ApplicationRecord
  belongs_to :activityable, polymorphic: true
  validates :code, uniqueness: true
end
