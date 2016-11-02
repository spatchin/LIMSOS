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
#  created_by         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  inventory_type     :string
#  owner_id           :integer
#

require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
