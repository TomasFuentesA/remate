class Auction < ApplicationRecord
  belongs_to :auctionnotice
  belongs_to :realty
  belongs_to :court
  has_many :judgements, dependent: :destroy

  accepts_nested_attributes_for :judgements, allow_destroy: true
  enum status: [:in_progress, :suspendend, :discarded]







  def horary
    "#{self.date} / #{self.hour} hrs."
  end


  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s}"
  end

  def name_of_the_judgment
    if self.judgements.empty?
      "#{self.judgements.first.parts.first.part1} / #{self.judgements.first.parts.first.part2}"

else
  "#{self.judgements}"
end
  end





end
