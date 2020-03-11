class Region < ApplicationRecord
  has_many :provinces
  accepts_nested_attributes_for :provinces
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'








  def self.my_import(file)
    regions = []
    CSV.foreach(file.path,headers:true) do |row|
      regions << Region.provinces.communes.new(row.to_h)
    end
    Region.import regions, recursive: true
  end



  def comuna
    "#{self.region.province.commune.name}, #{(self.region.province.name).to_s}, #{self.region.name}"
  end



end
