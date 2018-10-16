class AddSalesChannelIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :sales_channel_id, :integer
  end
end
