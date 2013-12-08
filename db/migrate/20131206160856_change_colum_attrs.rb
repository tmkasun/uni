class ChangeColumAttrs < ActiveRecord::Migration
  def change
    change_column(:users, :registration_number, :string)
  end
end
