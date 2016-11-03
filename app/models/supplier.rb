# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  name       :string
#  address1   :string
#  address2   :string
#  city       :string
#  zip        :string
#  phone1     :string
#  phone2     :string
#  fax        :string
#  contact    :string
#  email      :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Supplier < ApplicationRecord
  has_paper_trail

  has_many :inventory_batches

  validates :name, presence: true

  # rails_admin do
  # end
end
