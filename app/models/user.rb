# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string           default("User")
#  username               :string
#  first_name             :string
#  last_name              :string
#

class User < ApplicationRecord
  ROLES = %w(Admin User).freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :biomasses
  has_many :biomass_types
  has_many :feedstocks
  has_many :harvests
  has_many :inventories

  validates :role, presence: true, inclusion: { in: ROLES }
  validates :email, presence: true, uniqueness: true

  # override attribute writer
  def first_name=(val)
    write_attribute(:first_name, val.capitalize)
  end

  # override attribute writer
  def last_name=(val)
    write_attribute(:last_name, val.capitalize)
  end

  # for rails admin to display a name rather than 'User #1'
  def name
    if first_name && last_name
      "#{first_name} #{last_name}"
    elsif username
      username
    else
      email
    end
  end

  # to determine if user is admin
  def admin?
    role == 'Admin'
  end
end
