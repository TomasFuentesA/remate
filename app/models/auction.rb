class Auction < ApplicationRecord
  belongs_to :auctionnotice
  #belongs_to :realty
  belongs_to :judgement

  enum status: [:in_progress, :suspendend, :discarded]

  def horary
    "#{self.date} / #{self.hour} hrs."
  end


  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s} "
  end







end
