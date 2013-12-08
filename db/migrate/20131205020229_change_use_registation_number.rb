class ChangeUseRegistationNumber < ActiveRecord::Migration
  def change
    change_column(:users, :registration_number, :string, null: false, default: "")
  end
end
