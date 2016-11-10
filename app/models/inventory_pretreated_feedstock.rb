# == Schema Information
#
# Table name: inventory_pretreated_feedstocks
#
#  id                 :integer          not null, primary key
#  GLBRC_barcode      :string(255)
#  pretreat_method    :string(255)
#  grand_size         :string(255)
#  operator           :string(255)
#  notebook_reference :integer
#  stirring_RPM       :decimal(8, 2)
#  temperature        :decimal(8, 2)
#  NH3_loading        :decimal(8, 2)
#  overpressure       :decimal(8, 2)
#  residence_time     :decimal(8, 2)
#  weight             :string(255)
#  water_loading      :decimal(8, 2)
#  comments           :text(65535)
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :integer
#  active             :boolean          default(TRUE)
#
# Indexes
#
#  index_inventory_pretreated_feedstocks_on_inventory_batch_id  (inventory_batch_id)
#  index_inventory_pretreated_feedstocks_on_owner_id            (owner_id)
#
# Foreign Keys
#
#  fk_rails_b53adee590  (inventory_batch_id => inventory_batches.id)
#

class InventoryPretreatedFeedstock < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch
  belongs_to :owner, class_name: 'User'

  COLOR = 'success'
  ICON = 'book'
end
