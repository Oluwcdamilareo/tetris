class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :subtotal

      t.timestamps
    end
  end
end
