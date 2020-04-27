class Auction < ApplicationRecord
  belongs_to :auctionnotice
  belongs_to :realty
  belongs_to :court
  has_many :judgements, dependent: :destroy

  accepts_nested_attributes_for :judgements, allow_destroy: true
  enum status: [:in_progress, :suspendend, :discarded]










  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s}"
  end

  def name_of_the_judgment
    "#{self.judgement.part1} / #{self.judgement.part2}"
  end




end
