class CreateTempInvaders < ActiveRecord::Migration
  def change
    create_table :temp_invaders do |t|
      t.integer :invaderId
      t.integer :userId
      t.string :location

      t.timestamps null: false
    end
  end
end
