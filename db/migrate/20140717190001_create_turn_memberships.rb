class CreateTurnMemberships < ActiveRecord::Migration
  def change
    create_table :turn_memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :turn, index: true

      t.timestamps
    end
  end
end
