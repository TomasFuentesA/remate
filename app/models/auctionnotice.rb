class Auctionnotice < ApplicationRecord
  has_many :auctions, dependent: :destroy
  belongs_to :realty
  enum status: [:pending, :selected, :rejected, :joined]

  def self.created_by_day
    group_by_day(:created_at).count
  end


end
