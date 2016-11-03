class AddAccuracyToInvader < ActiveRecord::Migration
  def change
    add_column :invaders, :accuracy, :string
  end
end
