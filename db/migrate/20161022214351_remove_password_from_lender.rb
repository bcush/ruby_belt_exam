class RemovePasswordFromLender < ActiveRecord::Migration
  def change
    remove_column :lenders, :password, :string
  end
end
