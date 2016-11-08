# == Schema Information
#
# Table name: material_types
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MaterialType < ApplicationRecord
  has_paper_trail

  COLOR = 'info'
  ICON = 'book'
end
