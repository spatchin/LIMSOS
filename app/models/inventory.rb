# == Schema Information
#
# Table name: inventories
#
#  id                 :integer          not null, primary key
#  name               :string
#  inventory_batch_id :integer
#  qty                :integer
#  qty_unit           :integer
#  status             :string
#  storage_location   :string
#  custodian          :string
#  owner_id           :integer
#  comments           :text
#  created_by         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  inventory_type     :string
#

class Inventory < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true
end
