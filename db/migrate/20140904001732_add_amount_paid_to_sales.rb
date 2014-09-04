class AddAmountPaidToSales < ActiveRecord::Migration
  def change
    add_column :sales, :amount_paid, :integer
  end
end
