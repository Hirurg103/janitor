class AddAppointedAtToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :appointed_at, :date
  end
end
