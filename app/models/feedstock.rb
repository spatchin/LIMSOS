# == Schema Information
#
# Table name: feedstocks
#
#  id              :integer          not null, primary key
#  biomass_type_id :integer
#  harvest_id      :integer
#  amount          :float
#  unit            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  owner_id        :integer
#

class Feedstock < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :biomass_type
  belongs_to :harvest

  validates :owner, presence: true

  has_paper_trail
end
