class ChangeColumnDefaultAgain < ActiveRecord::Migration
  def change

    change_column_default :users, :registration_number, ""
  end
end
