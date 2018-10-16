class Order < ApplicationRecord
  has_many :line_items
  belongs_to :sales_channel
  
  accepts_nested_attributes_for :line_items

  after_validation :set_amount

  private
  def set_amount
    self.amount = line_items.map(&:product).map(&:cost).inject(:+)
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
