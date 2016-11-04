class CreateInvaders < ActiveRecord::Migration
  def change
    create_table :invaders do |t|
      t.string :name
      t.string :description
      t.string :hints
      t.string :location
      t.integer :users_id
      t.integer :accuracy
      t.integer :credibility

      t.timestamps null: false
    end
  end
end
