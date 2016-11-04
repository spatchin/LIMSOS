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
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owner_id          :integer
#
# Indexes
#
#  index_materials_on_owner_id  (owner_id)
#

require 'test_helper'

class MaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
