class Court < ApplicationRecord
  has_many :auctions
  has_many :judgements, dependent: :destroy

end
