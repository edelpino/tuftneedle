class AddDimensionsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :dimensions, :string
  end
end
