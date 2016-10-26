class Biomass < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  def self.owned_objects
    
  end
end
