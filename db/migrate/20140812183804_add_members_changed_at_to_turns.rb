class AddMembersChangedAtToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :members_changed_at, :date
  end
end
