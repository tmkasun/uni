class ChangeColumnDefault < ActiveRecord::Migration
  def change

    change_column_default :users, :registration_number, default: ""
  end
end
