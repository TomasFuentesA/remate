class Email < ApplicationRecord
  belongs_to :emailable, polymorphic: true, optional: true

  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/i
end
