class RemovePasswordFromBorrower < ActiveRecord::Migration
  def change
    remove_column :borrowers, :password, :string
  end
end
