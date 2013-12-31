class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.text :level
      t.text :semester
      t.text :name
      t.float :credits
      t.timestamps
    end
  end
end
