class Bank < ApplicationRecord

    has_many :country, dependent: :destroy
end
