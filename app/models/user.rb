# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string(255)      default("User")
#  username               :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  active_ws              :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  ROLES = %w(Admin User).freeze
  COLOR = 'primary'
  ICON = 'users'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :biomasses
  has_many :biomass_types
  has_many :feedstocks
  has_many :harvests
  has_many :inventories
  has_many :inventory_batches
  has_many :inventory_untreated_feedstocks
  has_many :inventory_pretreated_feedstocks
  has_many :inventory_hydrolysates
  has_many :materials

  before_validation(on: :create) do
    # create a username based on email
    if attribute_present?(:email) && !attribute_present?(:username)
      self.username = self.email.split('@').first
    end
  end

  validates :role, presence: true, inclusion: { in: ROLES }
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

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

  def admin?
    role == 'Admin'
  end

  # format: [id<int>, name<string>, icon<string>, color<string>]
  def self.workspaces
    [
      [1, 'Feedstock Management', 'leaf', 'success'],
      [2, 'Inventory Management', 'list-ol', 'warning'],
      [3, 'User<br>Management', 'users', 'primary']
    ]
  end
end
