class AddColumn < ActiveRecord::Migration
  def change

    add_column(:users, :registration_number, :string)
  end
end
