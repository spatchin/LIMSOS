class Feedstock < ApplicationRecord
  belongs_to :biomass_type
  belongs_to :harvest
end
