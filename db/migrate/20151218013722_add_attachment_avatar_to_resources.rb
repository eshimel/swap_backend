class AddAttachmentAvatarToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :resources, :avatar
  end
end
