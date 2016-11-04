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

require 'test_helper'

class BiomassTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
