# == Schema Information
#
# Table name: inventory_pretreated_feedstocks
#
#  id                 :integer          not null, primary key
#  GLBRC_barcode      :string
#  pretreat_method    :string
#  grand_size         :string
#  operator           :string
#  notebook_reference :integer
#  stirring_RPM       :decimal(8, 2)
#  temperature        :decimal(8, 2)
#  NH3_loading        :decimal(8, 2)
#  overpressure       :decimal(8, 2)
#  residence_time     :decimal(8, 2)
#  weight             :string
#  water_loading      :decimal(8, 2)
#  comments           :text
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :integer
#
# Indexes
#
#  index_inventory_pretreated_feedstocks_on_inventory_batch_id  (inventory_batch_id)
#  index_inventory_pretreated_feedstocks_on_owner_id            (owner_id)
#

class InventoryPretreatedFeedstock < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch
  belongs_to :owner, class_name: 'User'

end
