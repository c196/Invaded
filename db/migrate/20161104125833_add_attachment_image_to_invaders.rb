class AddAttachmentImageToInvaders < ActiveRecord::Migration
  def self.up
    change_table :invaders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :invaders, :image
  end
end
