# == Schema Information
#
# Table name: materials
#
#  id                :integer          not null, primary key
#  name              :string
#  mattype_code      :string
#  default_unit_code :string
#  parent_matcode    :string
#  min_level         :decimal(8, 2)
#  low_level         :decimal(8, 2)
#  created_by        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Material < ApplicationRecord
  has_paper_trail

  has_many :inventory_batches

  validates :name, presence: true
end
