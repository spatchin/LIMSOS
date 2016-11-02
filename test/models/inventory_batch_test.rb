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
#  created_by      :string
#  source_batch_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  material_id     :integer
#

require 'test_helper'

class InventoryBatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
