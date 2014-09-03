class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :quantity, null: false
      t.string :recipient
      t.string :gender
      t.string :source
      t.date :date
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
