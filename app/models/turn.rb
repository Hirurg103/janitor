class Turn < ActiveRecord::Base
  has_many :turn_memberships, dependent: :destroy
  has_many :members, through: :turn_memberships, source: :user

  has_many :duties
end
