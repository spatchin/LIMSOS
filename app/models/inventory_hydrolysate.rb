# == Schema Information
#
# Table name: inventory_hydrolysates
#
#  id                 :integer          not null, primary key
#  barcode            :string
#  custom_batch_no    :integer
#  batch_volume       :decimal(8, 2)
#  glucan_desired     :decimal(8, 2)
#  glucan_theoretical :decimal(8, 2)
#  biomass_moisture   :decimal(8, 2)
#  source_weight      :decimal(8, 2)
#  batch_weight       :decimal(8, 2)
#  comments           :text
#  created_by         :string
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InventoryHydrolysate < ApplicationRecord
  has_paper_trail
  
  belongs_to :inventory_batch
end
