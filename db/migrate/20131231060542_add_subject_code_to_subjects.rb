class AddSubjectCodeToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :subject_code, :text
  end
end
