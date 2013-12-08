class RenameRegistrationNumberToDefault < ActiveRecord::Migration
  def change
    rename_column(:users, :registration_number, :email)
  end
end
