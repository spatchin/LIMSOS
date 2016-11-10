# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  zip        :string(255)
#  phone1     :string(255)
#  phone2     :string(255)
#  fax        :string(255)
#  contact    :string(255)
#  email      :string(255)
#  website    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(TRUE)
#

class Supplier < ApplicationRecord
  has_paper_trail

  has_many :inventory_batches

  validates :name, presence: true

  COLOR = 'primary'
  ICON = 'address-card'
end
