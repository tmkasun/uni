class AddPdfAssertToProfile < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :cv
  end

  def self.down
    remove_attachment :profiles, :cv
  end
end
