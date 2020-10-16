class Auction < ApplicationRecord
  belongs_to :auctionnotice
  #belongs_to :realty
  belongs_to :judgement

  #enum status: [:in_progress, :suspendend, :discarded]
  enum status: {'Remate en curso'=>0, 'Anulado'=>1, 'Cancelado'=>2 , 'Adjudicado'=>3}

  def horary
    "#{self.date} / #{self.hour} hrs."
  end


  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s} "
  end







end
