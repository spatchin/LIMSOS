class BiomassType < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  def self.owned_objects
    all.reject { |o| o.owner != current_user }
  end
end
