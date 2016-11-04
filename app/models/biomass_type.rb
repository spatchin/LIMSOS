# == Schema Information
#
# Table name: biomass_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
# Indexes
#
#  index_biomass_types_on_owner_id  (owner_id)
#

class BiomassType < ApplicationRecord
  has_paper_trail

  belongs_to :owner, class_name: 'User'

  has_many :feedstocks

  validates :name, presence: true

  COLOR = 'info'
  ICON = 'book'
end
