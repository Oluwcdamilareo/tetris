class AddCustomerNameAndDeliveryAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_name, :string
  end
end
