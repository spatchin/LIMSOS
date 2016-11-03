# == Schema Information
#
# Table name: inventory_untreated_feedstocks
#
#  id                 :integer          not null, primary key
#  plant_date         :date
#  harvest_date       :date
#  plant_location     :string
#  plant_field        :string
#  grand_size         :string
#  comments           :text
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

class InventoryUntreatedFeedstock < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch
  belongs_to :owner, class_name: 'User'

end
