class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :buyer, index: true
      t.references :seller, index: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :transactions, :users, column: :buyer_id
    add_foreign_key :transactions, :users, column: :seller_id
  end
end
