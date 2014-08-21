class User < ActiveRecord::Base
  include Clearance::User
  has_many :turn_memberships, dependent: :destroy
  has_many :turns, through: :turn_memberships
end
