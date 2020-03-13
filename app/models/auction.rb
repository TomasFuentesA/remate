class Auction < ApplicationRecord
  belongs_to :auctionnotice
  belongs_to :realty
  has_many :judgements
  accepts_nested_attributes_for :judgements
  enum status: [:in_progress, :suspendend, :discarded]










  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s}"
  end





end
