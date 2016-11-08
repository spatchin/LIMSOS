# == Schema Information
#
# Table name: biomass_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  active     :boolean          default(TRUE)
#
# Indexes
#
#  index_biomass_types_on_owner_id  (owner_id)
#

class BiomassType < ApplicationRecord
  include RailsAdminCharts
  has_paper_trail

  belongs_to :owner, class_name: 'User'

  has_many :feedstocks

  validates :name, presence: true

  COLOR = 'info'.freeze
  ICON = 'book'.freeze

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
