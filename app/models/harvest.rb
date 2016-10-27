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

class Harvest < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :biomass

  validates :owner, presence: true

  has_paper_trail
end
