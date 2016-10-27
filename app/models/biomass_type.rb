# == Schema Information
#
# Table name: biomass_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class BiomassType < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true
  validates :owner, presence: true

  has_paper_trail

  def before_import_save(record)
    record.owner = current_user
  end  
end
