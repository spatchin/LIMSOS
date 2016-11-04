# == Schema Information
#
# Table name: material_types
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MaterialTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
