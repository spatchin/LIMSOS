# == Schema Information
#
# Table name: inventory_untreated_feedstocks
#
#  id                 :integer          not null, primary key
#  plant_date         :date
#  harvest_date       :date
#  plant_location     :string
#  plant_field        :string
#  grand_size         :string
#  comments           :text
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :integer
#
# Indexes
#
#  index_inventory_untreated_feedstocks_on_inventory_batch_id  (inventory_batch_id)
#  index_inventory_untreated_feedstocks_on_owner_id            (owner_id)
#

require 'test_helper'

class InventoryUntreatedFeedstockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
