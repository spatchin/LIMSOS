# == Schema Information
#
# Table name: inventory_untreated_feedstocks
#
#  id                 :integer          not null, primary key
#  plant_date         :date
#  harvest_date       :date
#  plant_location     :string(255)
#  plant_field        :string(255)
#  grand_size         :string(255)
#  comments           :text(65535)
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :integer
#
# Indexes
#
#  index_inventory_untreated_feedstocks_on_inventory_batch_id  (inventory_batch_id)
#  index_inventory_untreated_feedstocks_on_owner_id            (owner_id)
#
# Foreign Keys
#
#  fk_rails_d4e1f012fb  (inventory_batch_id => inventory_batches.id)
#

class InventoryUntreatedFeedstock < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch
  belongs_to :owner, class_name: 'User'

  COLOR = 'info'
  ICON = 'book'
end
