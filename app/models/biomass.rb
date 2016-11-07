# == Schema Information
#
# Table name: biomasses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  active     :boolean          default(TRUE)
#
# Indexes
#
#  index_biomasses_on_owner_id  (owner_id)
#

class Biomass < ApplicationRecord
  has_paper_trail

  has_many :harvests

  belongs_to :owner, class_name: 'User'

  validates :name, presence: true

  COLOR = 'success'.freeze
  ICON = 'leaf'.freeze
end
