# == Schema Information
#
# Table name: inventory_batches
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  container_type  :string(255)
#  supplier_id     :integer
#  lot_no          :string(255)
#  comments        :text(65535)
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
# Foreign Keys
#
#  fk_rails_74d271c723  (material_id => materials.id)
#  fk_rails_7a138d0a2e  (supplier_id => suppliers.id)
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

  COLOR = 'info'
  ICON = 'book'  
end
