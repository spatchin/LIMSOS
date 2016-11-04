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

class MaterialType < ApplicationRecord
  has_paper_trail

  COLOR = 'info'
  ICON = 'book'
end
