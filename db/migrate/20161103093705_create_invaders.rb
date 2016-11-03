class CreateInvaders < ActiveRecord::Migration
  def change
    create_table :invaders do |t|
      t.string :name
      t.string :location
      t.integer :users_id
      t.string :image

      t.timestamps null: false
    end
  end
end
