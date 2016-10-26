class Feedstock < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :biomass_type
  belongs_to :harvest
end
