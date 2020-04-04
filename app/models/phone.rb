class Phone < ApplicationRecord
  belongs_to :phoneable, polymorphic: true, optional: true
end
