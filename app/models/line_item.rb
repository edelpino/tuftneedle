class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
end

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint(8)        not null, primary key
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
