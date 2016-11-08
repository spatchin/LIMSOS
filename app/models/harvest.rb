# == Schema Information
#
# Table name: harvests
#
#  id                      :integer          not null, primary key
#  biomass_id              :integer
#  plot_location           :string(255)
#  plot_information        :string(255)
#  fertilizer_types        :string(255)
#  fertilizer_applications :string(255)
#  soil_information        :string(255)
#  weather_information     :string(255)
#  storage_location        :string(255)
#  planting_date           :date
#  harvest_date            :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  owner_id                :integer
#  active                  :boolean          default(TRUE)
#
# Indexes
#
#  index_harvests_on_biomass_id  (biomass_id)
#  index_harvests_on_owner_id    (owner_id)
#
# Foreign Keys
#
#  fk_rails_b184b49486  (biomass_id => biomasses.id)
#

class Harvest < ApplicationRecord
  include RailsAdminCharts
  has_paper_trail

  has_many :feedstocks

  belongs_to :owner, class_name: 'User'
  belongs_to :biomass

  COLOR = 'warning'.freeze
  ICON = 'truck'.freeze

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
