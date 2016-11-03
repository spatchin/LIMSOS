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

class InventoryBatch < ApplicationRecord
  has_paper_trail

  belongs_to :supplier
  belongs_to :material
  belongs_to :owner, class_name: 'User'

  has_many :inventories
  has_many :inventory_pretreated_feedstocks
  has_many :inventory_untreated_feedstocks
  has_many :inventory_hydrolysates

  validates :name, presence: true
end
