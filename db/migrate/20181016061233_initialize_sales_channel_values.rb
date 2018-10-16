class InitializeSalesChannelValues < ActiveRecord::Migration[5.1]
  def change
  	sales_channels_params = [{key:'online', name:'Online'},{key:'customer_service_rep', name:'CX'},{key:'retail',name:'Retail'}]
  	sales_channels_params.each do |sales_channel_param|
  		sales_channel = SalesChannel.where(key:[sales_channel_param[:key]]).first_or_create
  		sales_channel.update(sales_channel_param)
  	end
  end
end
