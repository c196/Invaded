class AddCredibilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credibility, :integer
    add_column :users, :score, :integer
  end
end
