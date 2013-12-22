class RenameStudentsToProfile < ActiveRecord::Migration
  def change
    rename_table :students, :profiles #http://stackoverflow.com/questions/4826879/how-to-re-name-a-activerecord-model-which-can-automatically-change-the-table-nam

  end
end
