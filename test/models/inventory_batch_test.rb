# == Schema Information
#
# Table name: inventory_batches
#
#  id              :integer          not null, primary key
#  name            :string
#  container_type  :string
#  supplier_id     :integer
#  lot_no          :string
#  comments        :text
#  source_batch_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  material_id     :integer
#  owner_id        :integer
#
# Indexes
#
#  index_inventory_batches_on_material_id  (material_id)
#  index_inventory_batches_on_owner_id     (owner_id)
#  index_inventory_batches_on_supplier_id  (supplier_id)
#

require 'test_helper'

class InventoryBatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
