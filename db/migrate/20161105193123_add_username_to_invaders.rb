class AddUsernameToInvaders < ActiveRecord::Migration
  def change
    add_column :invaders, :username, :string
  end
end
