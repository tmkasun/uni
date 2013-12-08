class AddDefaultValuesToGender < ActiveRecord::Migration
  def change
    change_column_default :students, :gender, "N/A"
  end
end
