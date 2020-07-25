class Auctionlisting < ApplicationRecord
  mount_uploader :attached, ListingdocUploader

   # after_create :separation_paragraphs
   #
   # def separation_paragraphs
   #   data = self.attached
   #
    require 'docx'
   #   file = Docx::Document.open('listado.docx')
   #
   #   #paragraphs = file.paragraphs.split('\n\n')
   #

   # end


   after_save :separation_paragraphs

   def separation_paragraphs

    data = Docx::Document.open(self.attached.current_path)
    data.paragraphs.each do |p|
       if p != "\n" and Auctionnotice.where(auction: p.to_s).count == 0
        Auctionnotice.create(auction: p.to_s)
      end
    end
   end
 end
