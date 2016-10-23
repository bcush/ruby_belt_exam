class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :borrower, index: true, foreign_key: true
      t.references :lender, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
