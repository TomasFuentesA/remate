class Email < ApplicationRecord
  attr_accessor :email_a, :email_b,:email_c
  belongs_to :emailable, polymorphic: true
end
