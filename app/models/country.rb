class Country < ApplicationRecord

    has_many :banks, dependent: :destroy
end
