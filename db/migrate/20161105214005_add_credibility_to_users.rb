class AddCredibilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credibility, :integer, :default => 500
    add_column :users, :score, :integer, :default => 0
  end
end
