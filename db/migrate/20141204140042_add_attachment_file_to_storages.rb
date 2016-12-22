class AddAttachmentFileToStorages < ActiveRecord::Migration
  def self.up
    change_table :storages do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :storages, :file
  end
end
