class AddCustomerNameToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :customer_name, :string
  end
end
