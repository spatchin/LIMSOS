# == Schema Information
#
# Table name: material_types
#
#  id           :integer          not null, primary key
#  mattype_code :string
#  mat_category :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mattype_name :string
#

class MaterialType < ApplicationRecord
  has_paper_trail
end
