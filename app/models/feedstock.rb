# == Schema Information
#
# Table name: feedstocks
#
#  id              :integer          not null, primary key
#  biomass_type_id :integer
#  harvest_id      :integer
#  amount          :float(24)
#  unit            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  owner_id        :integer
#  active          :boolean          default(TRUE)
#
# Indexes
#
#  index_feedstocks_on_biomass_type_id  (biomass_type_id)
#  index_feedstocks_on_harvest_id       (harvest_id)
#  index_feedstocks_on_owner_id         (owner_id)
#
# Foreign Keys
#
#  fk_rails_7371252460  (biomass_type_id => biomass_types.id)
#  fk_rails_a40a44adbe  (harvest_id => harvests.id)
#

class Feedstock < ApplicationRecord
  include RailsAdminCharts
  has_paper_trail

  belongs_to :owner, class_name: 'User'
  belongs_to :biomass_type
  belongs_to :harvest

  COLOR = 'warning'.freeze
  ICON = 'barcode'.freeze

  def self.graph_data(since = 4.weeks.ago)
    [
      {
        name: 'Created',
        pointInterval: 1.day * 1000, # in ms
        pointStart: 4.weeks.ago.at_midnight.to_i * 1000, # also in ms
        data: all.delta_records_since(4.weeks.ago)
      }
    ]
  end
end
