# == Schema Information
#
# Table name: biomasses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
# Indexes
#
#  index_biomasses_on_owner_id  (owner_id)
#

require 'test_helper'

class BiomassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
