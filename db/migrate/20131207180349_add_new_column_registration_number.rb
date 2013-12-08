class AddNewColumnRegistrationNumber < ActiveRecord::Migration
  def change
    add_column :users, :registration_number, :string ,default: ""

  end
end
