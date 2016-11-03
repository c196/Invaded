class CreateInvaders < ActiveRecord::Migration
  def change
    create_table :invaders do |t|

      t.timestamps null: false
    end
  end
end
