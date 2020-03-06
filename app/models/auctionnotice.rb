class Auctionnotice < ApplicationRecord

  has_many :auctions
  accepts_nested_attributes_for :auctions
  enum status: [:pending, :selected, :rejected, :joined]

  def self.created_by_day
    group_by_day(:created_at).count
  end


end
