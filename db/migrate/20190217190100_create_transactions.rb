class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.date :date
      t.integer :amount
      t.string :category
      t.timestamps
    end
  end
end
