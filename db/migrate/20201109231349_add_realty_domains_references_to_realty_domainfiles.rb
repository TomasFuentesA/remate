class AddRealtyDomainsReferencesToRealtyDomainfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :realty_domainfiles, :realty_domains, foreign_key: true
  end
end
