class AddAttachmentImageToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :members, :image
  end
end
