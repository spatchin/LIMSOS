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

require 'test_helper'

class FeedstockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
