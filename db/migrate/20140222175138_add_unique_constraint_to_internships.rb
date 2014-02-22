class AddUniqueConstraintToInternships < ActiveRecord::Migration
  def change
    add_index :internships, :profile_id, :unique => true
  end
end
