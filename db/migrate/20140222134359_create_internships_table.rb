class CreateInternshipsTable < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.belongs_to :profile
      t.string :company_name
    end
  end
end
