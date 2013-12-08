class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :registration_number, null: false
      t.string :name, default: ""
      t.string :common_name, default: ""
      t.string :group
      t.string :phone_number
      t.text   :home_address 
      t.string :school
      t.string :al_stream
      t.string :degree
      t.string :nationality, default: "Srilankan"
      t.string :profile_picture_location
      t.string :gender, null: false
      t.timestamps
    end
  end
end
