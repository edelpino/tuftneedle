Fabricator :product

Fabricator :twin_mattress_product, from: :product do
  name 'Twin Mattress'
  cost 325.0
end

# == Schema Information
#
# Table name: products
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  cost       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dimensions :string
#
