class TurnMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :turn

  validates_presence_of :user, :turn

  after_create :update_turn_members_changed_at
  after_destroy :update_turn_members_changed_at

  def update_turn_members_changed_at
    turn.update_attribute :members_changed_at, Date.today
  end
end
