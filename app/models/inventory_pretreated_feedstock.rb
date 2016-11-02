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
#  created_by         :integer
#  inventory_batch_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class InventoryPretreatedFeedstock < ApplicationRecord
  has_paper_trail

  belongs_to :inventory_batch

end
