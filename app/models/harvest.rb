class Harvest < ApplicationRecord
  belongs_to :biomass

  has_many :feedstocks
end
