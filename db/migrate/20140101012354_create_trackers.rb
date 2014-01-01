class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|

      t.timestamps
    end
  end
end
