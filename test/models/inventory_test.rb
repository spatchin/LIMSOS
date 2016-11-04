# == Schema Information
#
# Table name: inventories
#
#  id                 :integer          not null, primary key
#  name               :string
#  inventory_batch_id :integer
#  qty                :integer
#  qty_unit           :string
#  status             :string
#  storage_location   :string
#  custodian          :string
#  comments           :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  inventory_type     :string
#  owner_id           :integer
#
# Indexes
#
#  index_inventories_on_inventory_batch_id  (inventory_batch_id)
#

require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
