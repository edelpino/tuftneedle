class CreateSalesChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_channels do |t|
      t.string :key
      t.string :name

      t.timestamps
    end
  end
end
