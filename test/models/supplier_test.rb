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

require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
