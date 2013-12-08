class RemoveColumn < ActiveRecord::Migration
  def change

    remove_column(:users, :registration_number)
  end
end
