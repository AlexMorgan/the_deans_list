class AddPaypalIdToGirls < ActiveRecord::Migration
  def change
    add_column :girls, :paypal_id, :string
  end
end
