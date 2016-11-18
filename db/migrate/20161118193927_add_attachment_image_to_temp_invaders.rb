class AddAttachmentImageToTempInvaders < ActiveRecord::Migration
  def self.up
    change_table :temp_invaders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :temp_invaders, :image
  end
end
