# == Schema Information
#
# Table name: inventories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  inventory_batch_id :integer
#  qty                :integer
#  qty_unit           :string(255)
#  status             :string(255)
#  storage_location   :string(255)
#  custodian          :string(255)
#  comments           :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  inventory_type     :string(255)
#  owner_id           :integer
#  active             :boolean          default(TRUE)
#
# Indexes
#
#  index_inventories_on_inventory_batch_id  (inventory_batch_id)
#
# Foreign Keys
#
#  fk_rails_13968e8589  (inventory_batch_id => inventory_batches.id)
#

class Inventory < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true

  COLOR = 'info'
  ICON = 'book'
end
