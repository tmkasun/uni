class AddAttachmentPictureToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :profiles, :picture
  end
end
