class SalesChannel < ApplicationRecord
	has_many :orders
end

# == Schema Information
#
# Table name: sales_channels
#
#  id         :bigint(8)        not null, primary key
#  key        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
