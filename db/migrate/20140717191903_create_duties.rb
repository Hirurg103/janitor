class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.belongs_to :obliged, index: true
      t.belongs_to :turn, index: true

      t.timestamps
    end
  end
end
