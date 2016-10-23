class AddDefaultValueToRaised < ActiveRecord::Migration
  def change
    change_column :borrowers, :raised, :integer, :default => 0
  end
end
