class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :income, default: 0
      t.integer :budget, default: 0
      t.integer :expenses, default: 0

      t.timestamps
    end
  end
end
