# == Schema Information
#
# Table name: inventory_hydrolysates
#
#  id                 :integer          not null, primary key
#  barcode            :string(255)
#  custom_batch_no    :integer
#  batch_volume       :decimal(8, 2)
#  glucan_desired     :decimal(8, 2)
#  glucan_theoretical :decimal(8, 2)
#  biomass_moisture   :decimal(8, 2)
#  source_weight      :decimal(8, 2)
#  batch_weight       :decimal(8, 2)
#  comments           :text(65535)
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :integer
#
# Indexes
#
#  index_inventory_hydrolysates_on_inventory_batch_id  (inventory_batch_id)
#  index_inventory_hydrolysates_on_owner_id            (owner_id)
#
# Foreign Keys
#
#  fk_rails_055e67d819  (inventory_batch_id => inventory_batches.id)
#

class InventoryHydrolysate < ApplicationRecord
  has_paper_trail
  
  belongs_to :inventory_batch

  COLOR = 'info'
  ICON = 'book'  
end
