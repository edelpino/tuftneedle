require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test '#set_amount' do
    order = Fabricate.build(:order, line_items: [
      Fabricate.build(:line_item,
        product: Fabricate.build(:twin_mattress_product)
      )
    ]).tap(&:valid?)
    assert_equal order.amount, 325.0
  end
end

# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  amount           :float
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_name    :string
#  sales_channel_id :integer
#
