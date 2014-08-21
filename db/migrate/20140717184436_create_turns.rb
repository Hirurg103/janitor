class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|

      t.timestamps
    end
  end
end
