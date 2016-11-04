# == Schema Information
#
# Table name: harvests
#
#  id                      :integer          not null, primary key
#  biomass_id              :integer
#  plot_location           :string
#  plot_information        :string
#  fertilizer_types        :string
#  fertilizer_applications :string
#  soil_information        :string
#  weather_information     :string
#  storage_location        :string
#  planting_date           :date
#  harvest_date            :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  owner_id                :integer
#
# Indexes
#
#  index_harvests_on_biomass_id  (biomass_id)
#  index_harvests_on_owner_id    (owner_id)
#

class Harvest < ApplicationRecord
  has_paper_trail

  has_many :feedstocks

  belongs_to :owner, class_name: 'User'
  belongs_to :biomass

  COLOR = 'warning' # for coloring the workspace panels; based on bs
  ICON = 'truck'
end
