class Auction < ApplicationRecord
  belongs_to :auctionnotice
  belongs_to :realty
  belongs_to :court
  has_many :judgements
  accepts_nested_attributes_for :judgements


  enum status: [:in_progress, :suspendend, :discarded]
  enum type_judgment: [:ejecutivo,:hipotecario,:tesoreria,:laboral,:familia,:arbitral,:quiebra,:voluntario]









  def rol_trial
    "#{self.lyrics} - #{(self.number).to_s}-#{(self.year).to_s}"
  end





end
