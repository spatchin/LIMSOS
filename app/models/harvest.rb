class Harvest < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :biomass
end
