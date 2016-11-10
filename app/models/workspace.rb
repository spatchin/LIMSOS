# == Schema Information
#
# Table name: workspaces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  icon       :string(255)
#  models     :text(65535)
#  admin_only :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workspace < ApplicationRecord
  serialize :models, Array

  COLOR = 'success'
  ICON = 'users'
end
