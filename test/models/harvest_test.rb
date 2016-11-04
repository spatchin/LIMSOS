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

require 'test_helper'

class HarvestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
